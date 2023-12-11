package it_sci.controller;


import it_sci.model.*;
import it_sci.service.*;
import it_sci.utils.ImgPath;
import org.apache.poi.ss.formula.functions.T;
import org.apache.poi.ss.usermodel.*;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.print.attribute.standard.PresentationDirection;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
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

    @Autowired
    private JavaMailSender emailSender;



    /***************************open assign teacher*****************************/
    @RequestMapping("/{company_id}/assign_teacher/{term}")
    public String gotoAssignTeacherPage (@PathVariable("company_id") int company_id,
                                         @PathVariable("term") String term,Model model) {
        Company company = companyService.getCompanyById(company_id);
        List<Teacher> teacher = teacherService.getAllTeachers();

        String formatTerm = term.replace("_","/");
        System.out.println("Term format : " + formatTerm);
//        List<String> semesters  = teacherEvaluateService.getAllListSemester();


        model.addAttribute("formatTerm", formatTerm);
        model.addAttribute("companies", company);
        model.addAttribute("teachers", teacher);
//        model.addAttribute("list_semester", teacherEvaluateService.getAllListSemester();
        return "coordinator/assign_teacher";
    }


    /******** Btn Search ********/
    @PostMapping("/{company_id}/assign_teacher_by_company")
    public String submitAssignTeacher(@PathVariable("company_id") int company_id, @RequestParam Map<String, String> map, Model model, HttpServletRequest request) throws ParseException {

        SimpleDateFormat outputDateFormat = new SimpleDateFormat("yyyy-MM-dd");

        String teacherSuperVisionDate = request.getParameter("teachersupervisiondate");


        String term = map.get("semester");
        String assigntime = map.get("teachersupervisiontime");

        System.out.println("companyId " + company_id);
        System.out.println("time " + assigntime);
        System.out.println("!! formatTerm : " + request.getParameter("format_term"));
        model.addAttribute("formatTerm" , request.getParameter("format_term"));


        try {
            // 5. ส่งข้อมูลไปรับคำร้องข้อมูลที่ใช้วันที่แบบค.ศ.
            model.addAttribute("assign_teacher", teacherEvaluateService.getAssignTeacher(company_id, term, outputDateFormat.parse(teacherSuperVisionDate), assigntime));
            model.addAttribute("companies", companyService.getCompanyById(company_id));
            model.addAttribute("thaiDateString", request.getParameter("teachersupervisiondate"));
            model.addAttribute("assigntime", assigntime);
            System.out.println("pass");
        } catch (ParseException e) {
            System.out.println("fail");
        }
        return "/coordinator/assign_teacher";
    }

    /******** Insert ********/
    @PostMapping("/{company_id}/assign_teacher_by_company_submit")
    public String submitAssignTeacher(@PathVariable("company_id") int company_id, Model model, HttpServletRequest request) throws ParseException {

        SimpleDateFormat outputDateFormat = new SimpleDateFormat("yyyy-MM-dd");

        String Fterm = request.getParameter("formatTerm");
        Teacher teacher = teacherService.getTeacherById(Integer.parseInt(request.getParameter("teacher")));

        model.addAttribute("list_semester", teacherEvaluateService.getAllListSemester());


        List<Student> students = studentService.getStudentByCompanyId(Integer.parseInt(request.getParameter("comId")), Fterm);
        System.out.println("students : " + students);

        for (Student student : students) {
            TeacherEvaluate teacherEvaluate = new TeacherEvaluate();

            teacherEvaluate.setScore(0);
            teacherEvaluate.setSemester(request.getParameter("formatTerm"));
            teacherEvaluate.setAssessment_startdate(new Date());
            teacherEvaluate.setAssessment_enddate(new Date());
            teacherEvaluate.setAssessment_status("ยังไม่ได้ประเมิน");
            teacherEvaluate.setTeacher_super_vision_date(outputDateFormat.parse(request.getParameter("dateVision")));
            teacherEvaluate.setTeacher_super_vision_time(request.getParameter("assTime"));
            teacherEvaluate.setTeacher(teacher);
            teacherEvaluate.setStudent(student);
            //teacher.getTeacherEvaluates().add(teacherEvaluate);
            System.out.println("teacherEvaluate : " + teacherEvaluate);
            System.out.println("teacher : " + teacher.getTeacher_id());
            System.out.println("student : " + student.getStudent_id());
            System.out.println("dateVision : " + request.getParameter("dateVision"));
            System.out.println("semester : " + request.getParameter("formatTerm"));
            System.out.println("comId : " + request.getParameter("comId"));
            System.out.println("assTime : " + request.getParameter("assTime"));
            System.out.println("TecherId : " + request.getParameter("teacher"));
            System.out.println("assTime : " + request.getParameter("assTime"));

            teacherEvaluateService.saveTeacherEvaluate(teacherEvaluate);
            model.addAttribute("stt","true");
        }

        return "redirect:/company/list_company/";
    }


    /***************************update assign teacher*****************************/
    @GetMapping("/{company_id}/update_assign_teacher/{term}")
    public String updateAssignTeacher (@PathVariable("company_id") int company_id,
                                       @PathVariable("term") String term,Model model,HttpServletRequest request){


        String formatTerm = term.replace("_","/");
        System.out.println("Term format : " + formatTerm);

        TeacherEvaluate teacherEvaluate = companyService.getUpdateAssignTeacher(company_id);

        Teacher teacher = teacherEvaluateService.getUpdateAssignTeacher(company_id, teacherEvaluate.getSemester(), teacherEvaluate.getTeacher_super_vision_date(), teacherEvaluate.getTeacher_super_vision_time());
        model.addAttribute("formatTerm", formatTerm);
        model.addAttribute("company", teacherEvaluate);
        model.addAttribute("select_teacher", teacher);
        if (teacher != null){
            System.out.println("found");
        }else {
            System.out.println("not found");
        }
        model.addAttribute("update_teacher", teacherEvaluateService.getTeacherByStatusOn());
        model.addAttribute("teacher",teacherService.getAllTeachers());
        model.addAttribute("stt","false");
        return "coordinator/edit_assign_teacher";
    }

    @PostMapping("/{company_id}/update_assign_by_company_submit")
    public String updateCompanyAssign(@PathVariable("company_id") int company_id, Model model, HttpServletRequest request) throws ParseException, UnsupportedEncodingException {

        SimpleDateFormat outputDateFormat = new SimpleDateFormat("yyyy-MM-dd");



        /********* Default Data ****************/
        String default_vision_time = request.getParameter("assTime");
        String default_semester = request.getParameter("termUp");
        String formatTerm = default_semester.replace("_","/");
        int teacher_id = Integer.parseInt(request.getParameter("teacher"));

        LocalDate currentDate = LocalDate.parse(request.getParameter("dateVision"));
        System.out.println("default_vision_date : " +  currentDate);
        System.out.println("default_vision_time : " + default_vision_time);
        System.out.println("default_semester : " + formatTerm);
        System.out.println("teacherId : " + teacher_id);

        List<TeacherEvaluate> teacherEvaluate =  teacherEvaluateService.getSubmitAssignTeacher(company_id,formatTerm);
        String redirectPath = null;
        for (TeacherEvaluate listTe : teacherEvaluateService.getCheckAssignTeacher()){
            System.out.println("listTe Date : " + listTe.getTeacher_super_vision_date());

            if (outputDateFormat.parse(String.valueOf(currentDate)).equals(listTe.getTeacher_super_vision_date()) && default_vision_time.equals(listTe.getTeacher_super_vision_time()) && teacher_id == listTe.getTeacher().getTeacher_id()){
                model.addAttribute("status_update", "false");
                String substring = default_semester.substring(11);
                String thaiPart = URLEncoder.encode("ภาคเรียนที่" + substring, "UTF-8");
                redirectPath = "redirect:/teacher/"+company_id+"/update_assign_teacher/"+thaiPart;
                break;
            }else {
                if (teacherEvaluate.size() != 0){
                    for (TeacherEvaluate t : teacherEvaluate){
                        t.setTeacher_super_vision_date(outputDateFormat.parse(String.valueOf(currentDate)));
                        t.setTeacher_super_vision_time(default_vision_time);
                        t.setTeacher(teacherService.getTeacherById(Integer.parseInt(request.getParameter("teacher"))));
                        teacherEvaluateService.saveTeacherEvaluate(t);
                    }
                    System.out.println("PASS !!");
                    redirectPath = "redirect:/company/list_company/";
                }
            }
        }
        model.addAttribute("stt","true");
        return redirectPath;
    }

    @RequestMapping("/{teacher_id}/list_company_by_teacher")
    public String gotoListCompanySupervision (@PathVariable("teacher_id") int teacher_id,Model model) {

        model.addAttribute("term",teacherEvaluateService.getAllListSemester().get(0));
        model.addAttribute("list_semester", teacherEvaluateService.getAllListSemester());
        model.addAttribute("companies", teacherService.getListCompanySupervision(teacherEvaluateService.getAllListSemester().get(0),teacher_id));
        return "teacher/list_company";
    }

    @GetMapping("/{teacher_id}/select_semester_list_company")
    public String getSelectSemesterListCompanySupervision (HttpServletRequest request, @PathVariable("teacher_id") int teacher_id, Model model){
        String term = request.getParameter("semesterSelect");

        model.addAttribute("term", term);
        model.addAttribute("list_semester", teacherEvaluateService.getAllListSemester());
        model.addAttribute("companies", teacherService.getListCompanySupervision(term,teacher_id));
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

    @GetMapping("/{teacher_id}/select_semester_list_teacher_evaluate")
    public String getSelectSemesterListTeacherEvaluate(HttpServletRequest request, Model model){
        String term = request.getParameter("semesterSelect");

        model.addAttribute("term", term);
        model.addAttribute("list_semester", teacherEvaluateService.getAllListSemester());
        model.addAttribute("list_teacher_evaluate", teacherEvaluateService.getListTeacherEvaluateBySemester(term));
        return "teacher/list_evaluate";
    }

    /***************************open list evaluate*****************************/
    @GetMapping("/list_evaluate_by_teacher/{teacher_id}")
    public String getViewTeacherEvaluate(@PathVariable("teacher_id") int id, Model model) {
        List<String> semesters  = teacherEvaluateService.getAllListSemester();
        List<TeacherEvaluate> teacherEvaluates = teacherEvaluateService.getViewTeacherEvaluate(id);

        model.addAttribute("list_teacher_evaluate", teacherEvaluateService.getListTeacherEvaluateBySemester(teacherEvaluateService.getAllListSemester().get(0)));
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
        model.addAttribute("stt","false");
        return "teacher/evaluate";
    }

    /***************************submit evaluate*****************************/
    @PostMapping("/submit_evaluate_by_teacher/{ass_id}")
    public String submitEvaluateByTeacher (@RequestParam Map<String, String> map,Model model, @PathVariable long ass_id) {
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

        TeacherEvaluate teacherEvaluate1 = teacherEvaluateService.getTeacherEvaluateById(teacherEvaluate.getAssessment_id());
        TeacherAnswer teacherAnswer = new TeacherAnswer(radioAnswer,answerText1,answerText2,teacherEvaluate1);
        teacherEvaluateService.saveTeacherAnswer(teacherAnswer);
//        mentorEvaluateService.saveMentorEvaluate(mentorEvaluate);
//        teacherAnswer = (TeacherAnswer) currentSession.merge(teacherAnswer);

        model.addAttribute("stt","true");

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
    public String getListManageMentorLogin(HttpServletRequest request, Model model) {
        String term = request.getParameter("semesterSelect");
        System.out.println("term : " + term);
        if(term != null){
            model.addAttribute("mentors", mentorService.getManageLoginMentor(term));
            System.out.println("size: "  + mentorService.getManageLoginMentor(term.trim()).size());
        }else {
            model.addAttribute("mentors", mentorService.getManageLoginMentor(teacherEvaluateService.getAllListSemester().get(0)));
        }

        model.addAttribute("list_pass_nn", mentorService.getMentorPasswordNotNull());
        model.addAttribute("list_semester", teacherEvaluateService.getAllListSemester());
        model.addAttribute("term", term);

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
            SimpleMailMessage message = new SimpleMailMessage();
            message.setTo(mentor.getMentor_email());
            message.setSubject("แจ้งรหัสผ่าน");
            message.setText("รหัสผ่านของพี่เลี้ยง : " + map.get("password") + "\n" +
                            "ถ้าหากมีปัญหาประการใดกรุณาแจ้งอาจารย์ผู้เกี่ยวข้อง\nขอบคุณค่ะ");
            emailSender.send(message);
        }
        return "redirect:/teacher/manage_mentor_login/";
    }


    /*************************** list teacher status  *****************************/
    @GetMapping("/list_status_teacher")
    public String gotoListTeacherStatus (Model model) {

        model.addAttribute("list_semester", teacherEvaluateService.getAllListSemester());
        model.addAttribute("list_evaluate_status", teacherEvaluateService.getTeacherStatusBySemester(teacherEvaluateService.getAllListSemester().get(0)));
        return "coordinator/track_status_teacher";
    }

    @GetMapping("/select_semester_teacher_status")
    public String getSelectSemesterTeacherStatus(HttpServletRequest request, Model model){
        String term = request.getParameter("semesterSelect");

        model.addAttribute("term", term);
        model.addAttribute("list_semester", teacherEvaluateService.getAllListSemester());
        model.addAttribute("list_evaluate_status", teacherEvaluateService.getTeacherStatusBySemester(term));
        return "coordinator/track_status_teacher";
    }

    @RequestMapping("/list_status_mentor")
    public String gotoListMentorStatus (Model model) {

        model.addAttribute("list_semester", teacherEvaluateService.getAllListSemester());
        model.addAttribute("list_mentor_status",teacherEvaluateService.getMentorStatusBySemester(teacherEvaluateService.getAllListSemester().get(0)));
        return "coordinator/track_status_mentor";
    }

    @GetMapping("/select_semester_mentor_status")
    public String getSelectSemesterMentorStatus(HttpServletRequest request, Model model){
        String term = request.getParameter("semesterSelect");

        model.addAttribute("term", term);
        model.addAttribute("list_semester", teacherEvaluateService.getAllListSemester());
        model.addAttribute("list_mentor_status", teacherEvaluateService.getMentorStatusBySemester(term));
        return "coordinator/track_status_mentor";
    }


    /********************* View summary **********************************/
    @RequestMapping("/view_summary")
    public String gotoSummaryReport (Model model) {

        model.addAttribute("list_student", studentService.getListStudentsByTerm(teacherEvaluateService.getAllListSemester().get(0)));
        model.addAttribute("list_semester", teacherEvaluateService.getAllListSemester());
        return "coordinator/view_summary";
    }

    @GetMapping("select_semester_summary")
    public String getViewSummary(HttpServletRequest request, Model model){
        String term = request.getParameter("semesterSelect");
        System.out.println("term " + term);

        model.addAttribute("list_student", studentService.getListStudentsBySemester(term));
        model.addAttribute("term", term);
        model.addAttribute("list_semester", teacherEvaluateService.getAllListSemester());

        return "coordinator/view_summary";
    }

    /********************* open Export summary **********************************/
    @GetMapping("/{termFormat}/downloadExcel_summary")
    public void gotoExportSummaryReportPage (HttpServletResponse response, @PathVariable("termFormat") String term, Model model) throws IOException {

        String formatTerm = term.replace("_","/");
        System.out.println("Term format : " + formatTerm);
        List<Student> students = studentService.getListStudentsBySemester(formatTerm);

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

    /********************* Teacher Answer **********************************/
    @GetMapping("/teacher_answer")
    public String getTeacherAnswer(Model model) {
        List<TeacherAnswer> teacherAnswers = teacherEvaluateService.getTeacherAnswerBySemester();

        model.addAttribute("list_semester", teacherEvaluateService.getAllListSemester());
        return "coordinator/view_teacher_answer";
    }
    @GetMapping("/select_semester_teacher_answer")
    public String getSelectSemesterTeacher(HttpServletRequest request, Model model){
        String term = request.getParameter("semesterSelect");

        model.addAttribute("term", term);
        model.addAttribute("list_semester", teacherEvaluateService.getAllListSemester());
        model.addAttribute("list_student_teacher", teacherEvaluateService.getTeacherAnswerBySemester(term));
        return "coordinator/view_teacher_answer";
    }

    @GetMapping("/{termFormat}/downloadExcel_teacherAnswer")
    public void gotoExportTeacherAnswer (HttpServletResponse response, @PathVariable("termFormat") String term, Model model) throws IOException {

        System.out.println("termDefult :" + term);
        String formatTerm = term.replace("_","/");
        System.out.println("Term format : " + formatTerm);
        List<TeacherAnswer> teacherAnswers = teacherEvaluateService.getTeacherAnswerBySemester(formatTerm);
        System.out.println("teacherAnswers: " + teacherAnswers.size());

        // โหลดไฟล์ Excel โครงที่มีอยู่แล้ว
        FileInputStream inputStream = new FileInputStream(ImgPath.pathExcel + "/TeacherAnswer.xlsx");
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

        Row rowTitle = sheet.createRow(0);

        Cell cell = rowTitle.createCell(4);
        cell.setCellValue(formatTerm);
        for (TeacherAnswer tAns : teacherAnswers) {
            Row row = sheet.createRow(rowNum++);
            row.createCell(1).setCellValue(tAns.getTeacherEvaluate().getStudent().getStudent_id());
            row.createCell(2).setCellValue(tAns.getTeacherEvaluate().getStudent().getStudent_name() +"  "+ tAns.getTeacherEvaluate().getStudent().getStudent_lastname());
            row.createCell(3).setCellValue(tAns.getTeacherEvaluate().getStudent().getWorkposition());
            row.createCell(4).setCellValue(tAns.getTeacherEvaluate().getTeacher().getTeacher_name()+"  "+ tAns.getTeacherEvaluate().getTeacher().getTeacher_lastname());
            String[] parts = tAns.getAnswer_score().split(",");
            Cell cell5 = row.createCell(5);
            cell5.setCellValue(parts[0]);
            // เปลี่ยน row.getCell(6).setCellStyle(parts[1]); เป็น
            Cell cell6 = row.createCell(6);
            cell6.setCellValue(parts[1]);
            // เปลี่ยน row.getCell(7).setCellStyle(parts[2]); เป็น
            Cell cell7 = row.createCell(7);
            cell7.setCellValue(parts[2]);
            Cell cell8 = row.createCell(8);
            cell8.setCellValue(parts[3]);
            Cell cell9 = row.createCell(9);
            cell9.setCellValue(parts[4]);
            Cell cell10 = row.createCell(10);
            cell10.setCellValue(parts[5]);

            row.createCell(11).setCellValue(tAns.getAnswer_text1());
            row.createCell(12).setCellValue(tAns.getAnswer_text2());

        }

        String fileName = "TeacherAnswer";

        // ตั้งค่า Response Header
        response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
        response.setHeader("Content-Disposition", "attachment; filename="+fileName+".xlsx");

        // ส่งไฟล์ Excel กลับไปยังผู้ใช้
        workbook.write(response.getOutputStream());
        workbook.close();
    }

    /********************* Mentor Answer **********************************/
    @GetMapping("/mentor_answer")
    public String getMentorAnswer(Model model) {
        List<MentorAnswer> mentorAnswers = mentorEvaluateService.getMentorAnswerBySemester();

        model.addAttribute("list_semester", teacherEvaluateService.getAllListSemester());
        return "coordinator/view_mentor_answer";
    }

    @GetMapping("/select_semester_mentor_answer")
    public String getSelectSemester(HttpServletRequest request, Model model){
        String term = request.getParameter("semesterSelect");

        model.addAttribute("term", term);
        model.addAttribute("list_semester", teacherEvaluateService.getAllListSemester());
        model.addAttribute("list_student_mentor", teacherEvaluateService.getMentorAnswerBySemester(term));
        return "coordinator/view_mentor_answer";
    }

    /********************* open Export mentor_answer **********************************/
    @GetMapping("/{termFormat}/downloadExcel_mentorAnswer")
    public void gotoExportMentorAnswer (HttpServletResponse response, @PathVariable("termFormat") String term, Model model) throws IOException {

        String formatTerm = term.replace("_","/");
        System.out.println("Term format : " + formatTerm);
        List<MentorAnswer> mentorAnswers = teacherEvaluateService.getMentorAnswerBySemester(formatTerm);

        System.out.println("mentorAnswers: " + mentorAnswers.size());


        // โหลดไฟล์ Excel โครงที่มีอยู่แล้ว
        FileInputStream inputStream = new FileInputStream(ImgPath.pathExcel + "/MentorAnswer.xlsx");
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

        Row rowTitle = sheet.createRow(0);

        Cell cell = rowTitle.createCell(4);
        cell.setCellValue(formatTerm);
        for (MentorAnswer mAns : mentorAnswers) {
            Row row = sheet.createRow(rowNum++);
            row.createCell(1).setCellValue(mAns.getMentorEvaluate().getStudent().getStudent_id());
            row.createCell(2).setCellValue(mAns.getMentorEvaluate().getStudent().getStudent_name() +"  "+ mAns.getMentorEvaluate().getStudent().getStudent_lastname());
            row.createCell(3).setCellValue(mAns.getMentorEvaluate().getStudent().getWorkposition());
            row.createCell(4).setCellValue(mAns.getMentorEvaluate().getMentor().getMentor_name()+"  "+ mAns.getMentorEvaluate().getMentor().getMentor_lastname());
            String[] parts = mAns.getAnswer_score().split(",");
            Cell cell5 = row.createCell(5);
            cell5.setCellValue(parts[0]);
            // เปลี่ยน row.getCell(6).setCellStyle(parts[1]); เป็น
            Cell cell6 = row.createCell(6);
            cell6.setCellValue(parts[1]);
            // เปลี่ยน row.getCell(7).setCellStyle(parts[2]); เป็น
            Cell cell7 = row.createCell(7);
            cell7.setCellValue(parts[2]);
            Cell cell8 = row.createCell(8);
            cell8.setCellValue(parts[3]);
            Cell cell9 = row.createCell(9);
            cell9.setCellValue(parts[4]);
            Cell cell10 = row.createCell(10);
            cell10.setCellValue(parts[5]);
            Cell cell11 = row.createCell(11);
            cell11.setCellValue(parts[6]);
            Cell cell12 = row.createCell(12);
            cell12.setCellValue(parts[7]);
            Cell cell13 = row.createCell(13);
            cell13.setCellValue(parts[8]);
            Cell cell14 = row.createCell(14);
            cell14.setCellValue(parts[9]);
            Cell cell15 = row.createCell(15);
            cell15.setCellValue(parts[10]);

            row.createCell(16).setCellValue(mAns.getAnswer_text1());
            row.createCell(17).setCellValue(mAns.getAnswer_text2());
            row.createCell(18).setCellValue(mAns.getAnswer_text3());
            row.createCell(19).setCellValue(mAns.getAnswer_text4());
            row.createCell(20).setCellValue(mAns.getAnswer_text5());

        }

        String fileName = "MentorAnswer";

        // ตั้งค่า Response Header
        response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
        response.setHeader("Content-Disposition", "attachment; filename="+fileName+".xlsx");

        // ส่งไฟล์ Excel กลับไปยังผู้ใช้
        workbook.write(response.getOutputStream());
        workbook.close();
    }



}


