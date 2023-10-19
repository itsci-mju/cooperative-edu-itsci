package it_sci.controller;


import it_sci.model.*;
import it_sci.service.*;
import it_sci.utils.ImgPath;
import org.apache.poi.ss.usermodel.*;
import org.hibernate.Hibernate;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.transaction.Transactional;
import java.io.FileInputStream;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

import org.apache.poi.xssf.usermodel.XSSFWorkbook; // หรือ HSSFWorkbook ถ้าคุณใช้ .xls


@Controller
@RequestMapping("/teacher")
public class TeacherController {

    @Autowired
    private CompanyService companyService;

    @Autowired
    private StudentService studentService;

    @Autowired
    private SessionFactory sessionFactory;

    @Autowired
    private TeacherEvaluateService teacherEvaluateService;
    @Autowired
    private TeacherService teacherService;

    @Autowired
    private MentorEvaluateService mentorEvaluateService;

    @Autowired
    private MentorService mentorService;



    /***************************open assign teacher*****************************/
    @RequestMapping("/{company_id}/assign_teacher")
    public String gotoAssignTeacherPage (@PathVariable("company_id") int company_id, Model model) {
        Company company = companyService.getCompanyById(company_id);
        List<Teacher> teacher = teacherService.getAllTeachers();
//        List<String> semesters  = teacherEvaluateService.getAllListSemester();

        model.addAttribute("companies", company);
        model.addAttribute("teachers", teacher);
//        model.addAttribute("list_semester", semesters);
        return "coordinator/assign_teacher";
    }


    /***************************submit assign teacher and teacher evaluate*****************************/
    @Transactional
    @PostMapping("/{company_id}/submit_evaluate")
    public String submitEvaluate (@PathVariable("company_id") String company_id,@RequestParam Map<String, String> map) throws ParseException {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

        int score = 0;

        String semester = map.get("semester");

        Date assessment_startdate = new Date();

        Date assessment_enddate = new Date();

        String assessment_status = "ยังไม่ได้ประเมิน";

        Date teachersupervisiondate = dateFormat.parse(map.get("teachersupervisiondate"));

        String teachersupervisiontime = map.get("teachersupervisiontime");

        int teacher_id = Integer.parseInt(map.get("teacher"));
        Teacher teacher = teacherService.getTeacherById(teacher_id);
        System.out.println(teacher);
        int companyid = Integer.parseInt(company_id);
        List<Student> student = studentService.getStudentByCompanyId(companyid);
        for (int i = 0 ; i<student.size() ; i++){
            TeacherEvaluate teacherEvaluate = new TeacherEvaluate(score,semester,assessment_startdate,assessment_enddate,
                    assessment_status,teachersupervisiondate,teachersupervisiontime,teacher, student.get(i));
            Session currentSession = sessionFactory.getCurrentSession();
            teacherEvaluate = (TeacherEvaluate) currentSession.merge(teacherEvaluate);
        }

        return "redirect:/";
    }

    /***************************open list Company*****************************/
    @GetMapping("/{teacher_id}/list_company_by_teacher")
    public String listCompanyByTeacher (@PathVariable("teacher_id") int teacher_id, Model model) {
        List<String> semesters  = teacherEvaluateService.getAllListSemester();
        List<Company> company = teacherService.getCompanyToAssignByTeacher(teacher_id);

        model.addAttribute("companies",company);
        model.addAttribute("list_semester", semesters);
        return "teacher/list_company";
    }

    /***************************สลับหน้า list Company*****************************/
    @RequestMapping("/testgetlist/{teacher_id}")
    public String  testGetCompany(@RequestParam("semesterSelect") String semesterSelect, Model model,HttpServletRequest request,
                                @PathVariable int teacher_id){
        List<Company> companies = companyService.getCompaniesByStudentSemester(semesterSelect,teacher_id);
        List<String> semesters  = teacherEvaluateService.getAllListSemester();
        for (Company c : companies) {
            System.out.println(c.getCompany_name());
        }
        model.addAttribute("companies",companies);
        model.addAttribute("teacherId",teacher_id);
        model.addAttribute("list_semester", semesters);
        model.addAttribute("semesterSelect",semesterSelect);
        return "teacher/list_company";
    }

    /***************************open list student*****************************/
    @RequestMapping("/{teacher_id}/list_student_by_teacher/{company_id}/{semester}")
    public String gotoListStudentPage (@PathVariable("teacher_id") int teacher_id,
                                       @PathVariable("company_id") int company_id,
                                       @PathVariable("semester") String term, Model model) {

        String formatTerm = term.replace("_","/");
        System.out.println("Term format : " + formatTerm);
        List<TeacherEvaluate> teacherEvaluate = teacherEvaluateService.getTeacherEvaluateByTeacherId(teacher_id,company_id,formatTerm);
        model.addAttribute("ListStudents", teacherEvaluate);

        System.out.println("student : " + teacherEvaluate.size());

        return "teacher/list_student";
    }

    /***************************สลับหน้า list evaluate*****************************/
    @RequestMapping("/testgetlistevaluate/{teacher_id}")
    public String  testViewEvaluateSemester(@RequestParam("semesterSelect") String semesterSelect, Model model,HttpServletRequest request,
                                  @PathVariable int teacher_id){
        List<TeacherEvaluate> teacherEvaluates = teacherEvaluateService.getViewTeacherEvaluateByStudentSemester(semesterSelect,teacher_id);
        List<String> semesters  = teacherEvaluateService.getAllListSemester();
        System.out.println("teacherEvaluates size : " + teacherEvaluates.size());


        model.addAttribute("teacherId",teacher_id);
        model.addAttribute("list_teacher_evaluate",teacherEvaluates);
        model.addAttribute("list_semester", semesters);
        return "teacher/list_evaluate";
    }
    /***************************open list evaluate*****************************/
    @GetMapping("/list_evaluate_by_teacher/{teacher_id}")
    public String getViewTeacherEvaluate(@PathVariable("teacher_id") int id, Model model) {
        List<String> semesters  = teacherEvaluateService.getAllListSemester();
        List<TeacherEvaluate> teacherEvaluates = teacherEvaluateService.getViewTeacherEvaluate(id);

        model.addAttribute("list_teacher_evaluate", teacherEvaluates);
        model.addAttribute("list_semester", semesters);
        return "teacher/list_evaluate";
    }


    /***************************open evaluate*****************************/
    @GetMapping("/{student_id}/evaluate/{teacher_id}/{ass_id}")
    public String gotoEvaluatePage (@PathVariable("student_id") String student_id, Model model, HttpServletRequest request,
                                    @PathVariable int teacher_id, @PathVariable String ass_id) {
        request.setAttribute("teacher", teacherService.getTeacherById(teacher_id));
        model.addAttribute("student", studentService.getStudentById(student_id));
        model.addAttribute("ass_id",ass_id);
        model.addAttribute("teacher_evaluate_item", new TeacherEvaluate());
        return "teacher/evaluate";
    }

    /***************************submit evaluate*****************************/
    @PostMapping("/submit_evaluate_by_teacher/{ass_id}")
    public String submitEvaluateByTeacher (@RequestParam Map<String, String> map, @PathVariable long ass_id) {
        TeacherEvaluate teacherEvaluate = teacherEvaluateService.getTeacherEvaluateById(ass_id);
        int sumScore = 0;
        String radioAnswer = "";
        for (int i = 0; i <= 5; i++) {
            int score = Integer.parseInt(map.get("score" + (i + 1)));
            String radio = map.get("score"+(i+1));
            sumScore += score;
            radioAnswer = radioAnswer + radio + ",";

        }
        Date assessment_date = new Date();

        teacherEvaluate.setScore(sumScore);
        teacherEvaluate.setAssessment_date(assessment_date);
        teacherEvaluate.setAssessment_status("ประเมินแล้ว");
        teacherEvaluateService.updateTeacherEvaluate(teacherEvaluate);

        String answerText1 = map.get("answerText1");
        String answerText2 = map.get("answerText2");

        String answerTextTotal = answerText1 +","+ answerText2;


        TeacherEvaluate teacherEvaluate1 = teacherEvaluateService.getTeacherEvaluateById(teacherEvaluate.getAssessment_id());
        TeacherAnswer teacherAnswer = new TeacherAnswer(answerTextTotal,radioAnswer,teacherEvaluate1);
        teacherEvaluateService.saveTeacherAnswer(teacherAnswer);
//        mentorEvaluateService.saveMentorEvaluate(mentorEvaluate);
//        teacherAnswer = (TeacherAnswer) currentSession.merge(teacherAnswer);


        return "redirect:/teacher/"+teacherEvaluate.getTeacher().getTeacher_id()+"/list_company_by_teacher";
    }

    /***************************open view_student_detail*****************************/
    @GetMapping("/{id}/view_student_detail")
    public String getStudent(@PathVariable("id") String id, Model model) {
        Student student = teacherService.getStudent(id);
        model.addAttribute("student_detail", student);
        model.addAttribute("mentors",teacherService.getMentorsByStudentId(student.getStudent_id()));
        return "teacher/student_detail";
    }

    /***************************open manage_mentor_login*****************************/
    @GetMapping("/manage_mentor_login/")
    public String getListManageMentorLogin(Model model) {
        model.addAttribute("mentors", mentorService.getManageLoginMentor());
        model.addAttribute("list_pass_nn", mentorService.getMentorPasswordNotNull());
        return "coordinator/manage_mentor";
    }

    /***************************edit password mentor*****************************/
    @GetMapping("/manage_mentor_login/{mentor_id}")
    public String getManageMentorLogin(@PathVariable("mentor_id") int id, Model model) {
        model.addAttribute("mentors", mentorService.getMentorById(id));
        return "coordinator/manage_mentor_login";
    }

    /***************************update password mentor*****************************/
    @PostMapping("/manage_mentor_login/{mentor_id}")
    public String updateMentorPassword(@RequestParam Map<String, String> map, @PathVariable("mentor_id") int id) {
        BCryptPasswordEncoder bCryptPasswordEncoder = new BCryptPasswordEncoder();
        Mentor mentor = mentorService.getMentorById(id);
        if (mentor != null) {
            mentor.setPassword(bCryptPasswordEncoder.encode(map.get("password")));
            mentorService.updateMentorPassword(mentor);
        }
        return "redirect:/teacher/manage_mentor_login/";
    }

    /***************************switch list status teacher *****************************/
    @RequestMapping("/test_status_teacher")
    public String ListStatusTeacherBySemester (@RequestParam("semesterSelect") String semesterSelect, Model model) {
        System.out.println("Selected semester is : " + semesterSelect);
//        List<TeacherEvaluate> teacherEvaluates = teacherEvaluateService.getTeacherEvaluate();
//        List<MentorEvaluate> mentorEvaluates = mentorEvaluateService.getAllMentorEvaluates();
//        List<String> semesters  = teacherEvaluateService.getAllListSemester();
//        List<TeacherEvaluate> teacherEvaluate = teacherEvaluateService.getStatusByStudentSemester(semesterSelect);
//
//        model.addAttribute("list_mentor_status", mentorEvaluates);
//        model.addAttribute("list_semester", semesters);
//        model.addAttribute("list_evaluate_status", teacherEvaluate);
//        model.addAttribute("list_teacherEvaluates",teacherEvaluates);

        List<String> semesters  = teacherEvaluateService.getAllListSemester();
        model.addAttribute("list_semester", semesters);
        model.addAttribute("list_evaluate_status", teacherEvaluateService.getStatusByStudentSemester(semesterSelect));
        return "coordinator/track_status_teacher";
    }

    /***************************open list status teacher *****************************/
    @RequestMapping("/list_status_teacher")
    public String gotoListStatusTeacherPage (Model model) {
        List<String> semesters  = teacherEvaluateService.getAllListSemester();
        List<Student> students = studentService.getAllStudents();
        List<TeacherEvaluate> teacherEvaluates = teacherEvaluateService.getTeacherEvaluate();
        List<MentorEvaluate> mentorEvaluates = mentorEvaluateService.getAllMentorEvaluates();

        model.addAttribute("list_mentor_status", mentorEvaluates);
        model.addAttribute("list_semester", semesters);
        model.addAttribute("list_students", students);
        model.addAttribute("list_teacherEvaluates",teacherEvaluates);
        return "coordinator/track_status_teacher";
    }

    /***************************switch list status mentor *****************************/
    @RequestMapping("/test_status_mentor")
    public String ListStatusMentorBySemester (@RequestParam("semesterSelect") String semesterSelect, Model model) {
        System.out.println("Selected semester is : " + semesterSelect);
//        List<TeacherEvaluate> teacherEvaluates = teacherEvaluateService.getTeacherEvaluate();
//        List<MentorEvaluate> mentorEvaluates = mentorEvaluateService.getAllMentorEvaluates();
//        List<String> semesters  = teacherEvaluateService.getAllListSemester();
//        List<TeacherEvaluate> teacherEvaluate = teacherEvaluateService.getStatusByStudentSemester(semesterSelect);
//
//        model.addAttribute("list_mentor_status", mentorEvaluates);
//        model.addAttribute("list_semester", semesters);
//        model.addAttribute("list_evaluate_status", teacherEvaluate);
//        model.addAttribute("list_teacherEvaluates",teacherEvaluates);

        List<String> semesters  = teacherEvaluateService.getAllListSemester();
        model.addAttribute("list_semester", semesters);
        model.addAttribute("list_mentor_status", mentorEvaluateService.getStatusMentorByStudentSemester(semesterSelect));
        return "coordinator/track_status_mentor";
    }

    /***************************open list status mentor *****************************/
    @RequestMapping("/list_status_mentor")
    public String gotoListStatusMentorPage (Model model) {
        List<String> semesters  = teacherEvaluateService.getAllListSemester();
        List<Student> students = studentService.getAllStudents();
        List<TeacherEvaluate> teacherEvaluates = teacherEvaluateService.getTeacherEvaluate();
        List<MentorEvaluate> mentorEvaluates = mentorEvaluateService.getAllMentorEvaluates();

        model.addAttribute("list_mentor_status", mentorEvaluates);
        model.addAttribute("list_semester", semesters);
        model.addAttribute("list_students", students);
        model.addAttribute("list_teacherEvaluates",teacherEvaluates);
        return "coordinator/track_status_mentor";
    }


    /********************* switch view summary **********************************/
    @GetMapping("/testlist")
    public String testList (@RequestParam("semesterSelect") String semesterSelect, Model model) {
        System.out.println("Selected semester is : " + semesterSelect);
        List<String> semesters  = teacherEvaluateService.getAllListSemester();
        List<Student> students = studentService.getStudentsBySemester(semesterSelect);
        List<TeacherEvaluate> teacherEvaluates = teacherEvaluateService.getTeacherEvaluate();
        Session session = null;
        try  {
            session = sessionFactory.openSession();
            for (Student student : students) {
                // ดึงข้อมูล TeacherEvaluates และคำนวณคะแนนรวม
                Hibernate.initialize(student.getTeacherEvaluates());
            }
        }
        catch (Exception e) {
            // จัดการข้อผิดพลาด
        } finally {
            if (session != null && session.isOpen()) {
                session.close(); // ปิดเซสชัน
            }
        }
        model.addAttribute("list_semester", semesters);
        model.addAttribute("list_students", students);
        model.addAttribute("list_teacherEvaluates",teacherEvaluates);
        model.addAttribute("term",semesterSelect);
        System.out.println("STUDENT SIZE IS : " + students.size());
        return "coordinator/view_summary";
    }

//    @GetMapping("/selectSemester")
//    public String selectSemester(@RequestParam("semester") String selectedSemester, Model model) {
//        // ทำสิ่งที่คุณต้องการกับ selectedSemester ที่รับมา
//        // ยกตัวอย่างเช่น นำ selectedSemester ไปใช้ในการค้นหาข้อมูลนักศึกษาในภาคการศึกษานี้
//
//        // ส่งข้อมูลกลับไปยังหน้าเว็บ (View)
//        model.addAttribute("selectedSemester", selectedSemester);
//        return "coordinator/view_summary";
//    }

    /********************* open view summary **********************************/
    @RequestMapping("/view_summary")
    public String gotoSummaryPage (Model model) {
        List<String> semesters  = teacherEvaluateService.getAllListSemester();
        List<Student> students = studentService.getAllStudents();
        List<TeacherEvaluate> teacherEvaluates = teacherEvaluateService.getTeacherEvaluate();
        Session session = null;
        try  {
            session = sessionFactory.openSession();
            for (Student student : students) {
                // ดึงข้อมูล TeacherEvaluates และคำนวณคะแนนรวม
                Hibernate.initialize(student.getTeacherEvaluates());
            }
        }
        catch (Exception e) {
            // จัดการข้อผิดพลาด
        } finally {
            if (session != null && session.isOpen()) {
                session.close(); // ปิดเซสชัน
            }
        }
        model.addAttribute("list_semester", semesters);
        model.addAttribute("list_students", students);
        model.addAttribute("list_teacherEvaluates",teacherEvaluates);
        return "coordinator/view_summary";
    }

    /********************* open Export summary **********************************/
    @GetMapping("/{termFormat}/downloadExcel")
    public void gotoExportSummaryReportPage (HttpServletResponse response, @PathVariable("termFormat") String term, Model model) throws IOException {

        String formatTerm = term.replace("_","/");
        System.out.println("Term format : " + formatTerm);
        List<Student> students = studentService.getStudentsBySemester(formatTerm);

        System.out.println("students: " + students.size());


        // โหลดไฟล์ Excel โครงที่มีอยู่แล้ว
        FileInputStream inputStream = new FileInputStream(ImgPath.pathExcel + "/ExportSummaryReport.xlsx");
        //        Workbook workbook = new XSSFWorkbook(inputStream);
        Workbook workbook = new XSSFWorkbook(inputStream);
        inputStream.close();
        // สร้าง Workbook Excel
        Sheet sheet = workbook.getSheet("Sheet1");
        int rowNum = 2;
        // สร้าง DataFormat สำหรับรูปแบบวันที่ "dd/MM/yyyy"
        DataFormat dateFormat = workbook.createDataFormat();
        CellStyle dateCellStyle = workbook.createCellStyle();
        dateCellStyle.setDataFormat(dateFormat.getFormat("dd/MM/yyyy"));

//        Row rowTitle = sheet.createRow(0);
//        rowTitle.createCell(0).setCellValue(formatTerm);

        Row rowTitle = sheet.createRow(0);

// สร้างเซลล์ในแถวและตั้งค่าค่าที่คุณต้องการ
        Cell cell = rowTitle.createCell(4);
        cell.setCellValue(formatTerm);
        for (Student stu : students) {
            Row row = sheet.createRow(rowNum++);
            row.createCell(1).setCellValue(stu.getStudent_id());
            row.createCell(2).setCellValue(stu.getStudent_name() +"  "+ stu.getStudent_lastname());
            row.createCell(3).setCellValue(stu.getWorkposition());
            row.createCell(4).setCellValue(stu.getStartdate());
            row.getCell(4).setCellStyle(dateCellStyle);
            row.createCell(5).setCellValue(stu.getEnddate());
            row.getCell(5).setCellStyle(dateCellStyle);
            row.createCell(6).setCellValue(stu.getSumScoreMentor());
            row.createCell(7).setCellValue(stu.getSumScoreTeacher());
            // เพิ่มคอลัมน์อื่น ๆ ตามที่ต้องการ
        }

        String fileName = "ExportSummaryReport";

        // ตั้งค่า Response Header
        response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
        response.setHeader("Content-Disposition", "attachment; filename="+fileName+".xlsx");

        // ส่งไฟล์ Excel กลับไปยังผู้ใช้
        workbook.write(response.getOutputStream());
        workbook.close();
    }

}


