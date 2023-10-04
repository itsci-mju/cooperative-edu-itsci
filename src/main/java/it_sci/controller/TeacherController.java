package it_sci.controller;


import it_sci.model.*;
import it_sci.service.*;
import org.hibernate.Hibernate;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

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


    @RequestMapping("/{company_id}/assign_teacher")
    public String gotoAssignTeacherPage (@PathVariable("company_id") int company_id, Model model) {
        Company company = companyService.getCompanyById(company_id);
        List<Teacher> teacher = teacherService.getAllTeachers();
        model.addAttribute("companies", company);
        model.addAttribute("teachers", teacher);
        return "coordinator/assign_teacher";
    }

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
    @GetMapping("/{teacher_id}/list_company_by_teacher")
    public String listCompanyByTeacher (@PathVariable("teacher_id") int teacher_id, Model model) {
//        List<Company> company = companyService.getAllCompanies();
//        for (int i = 0 ; i < company.size() ; i++){
//            System.out.println(company.get(i).getCompany_id());
//
//        }
        List<Company> company = teacherService.getCompanyToAssignByTeacher(teacher_id);
        model.addAttribute("companies",company);
        return "teacher/list_company";
    }

    @RequestMapping("/{teacher_id}/list_student_by_teacher/{company_id}")
    public String gotoListStudentPage (@PathVariable("teacher_id") int teacher_id,
                                       @PathVariable("company_id") int company_id,Model model) {
        List<TeacherEvaluate> teacherEvaluate = teacherEvaluateService.getTeacherEvaluateByTeacherId(teacher_id,company_id);
        model.addAttribute("ListStudents", teacherEvaluate);

//        System.out.println(teacherEvaluate);
//        List<Student> students = mentorService.getMentorDoesNotHaveStudent(21);
//        System.out.println(students.size());
//        model.addAttribute("students",students);
//        System.out.println(students.size());
        return "teacher/list_student";
    }

    @GetMapping("/{student_id}/evaluate/{teacher_id}/{ass_id}")
    public String gotoEvaluatePage (@PathVariable("student_id") String student_id, Model model, HttpServletRequest request,
                                    @PathVariable int teacher_id, @PathVariable String ass_id) {
        request.setAttribute("teacher", teacherService.getTeacherById(teacher_id));
        model.addAttribute("student", studentService.getStudentById(student_id));
        model.addAttribute("ass_id",ass_id);
        model.addAttribute("teacher_evaluate_item", new TeacherEvaluate());
        return "teacher/evaluate";
    }

//    @Transactional
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


        return "redirect:/teacher/"+teacherEvaluate.getTeacher().getTeacher_id()+"/list_student_by_teacher/"+teacherEvaluate.getStudent().getCompany().getCompany_id();
    }

    @GetMapping("/list_evaluate_by_teacher/{teacher_id}")
    public String getViewTeacherEvaluate(@PathVariable("teacher_id") int id, Model model) {
        List<TeacherEvaluate> teacherEvaluates = teacherEvaluateService.getViewTeacherEvaluate(id);
        model.addAttribute("list_teacher_evaluate", teacherEvaluates);
        return "teacher/list_evaluate";
    }

    @GetMapping("/{id}/view_student_detail")
    public String getStudent(@PathVariable("id") String id, Model model) {
        Student student = teacherService.getStudent(id);
        model.addAttribute("student_detail", student);
        model.addAttribute("mentors",teacherService.getMentorsByStudentId(student.getStudent_id()));
        return "teacher/student_detail";
    }

    @GetMapping("/list_status/")
    public String getListStatus(Model model) {
        List<TeacherEvaluate> teacherEvaluates = teacherEvaluateService.getTeacherEvaluate();
        List<MentorEvaluate> mentorEvaluates = mentorEvaluateService.getAllMentorEvaluates();
        model.addAttribute("list_mentor_status", mentorEvaluates);
        model.addAttribute("list_teacher_status", teacherEvaluates);
        return "coordinator/track_status";
    }

//    @GetMapping("/list_status/{company_id}")
//    public String getListStatus(@RequestParam(name = "company_id", required = false) Integer companyId, Model model) {
//        // ดึงรายการบริษัทมาแสดงใน dropdown
//        List<Company> companies = companyService.getAllCompanies();
//
//        // ถ้าผู้ใช้เลือกบริษัท
//        if (companyId != null) {
//            List<TeacherEvaluate> teacherEvaluates = teacherEvaluateService.getTeacherEvaluateByCompany(companyId);
//            List<MentorEvaluate> mentorEvaluates = mentorEvaluateService.getMentorEvaluateByCompany(companyId);
//            model.addAttribute("list_mentor_status", mentorEvaluates);
//            model.addAttribute("list_teacher_status", teacherEvaluates);
//        }
//
//        model.addAttribute("list_companies", companies);
//
//        return "coordinator/track_status";
//    }


//    @GetMapping("/view_summary")
//    public String gotoSummaryPage(Model model, @RequestParam(name = "semesterId", required = false) Long semesterId) {
//        // ดึงรายการ semester มาแสดงใน dropdown
//        List<Semester> semesters = semesterService.getAllSemesters();
//
//        // ดึงรายการนักศึกษาและการประเมินอาจารย์โดยใช้ semesterId ถ้ามีการเลือก semester
//        List<Student> students;
//        List<TeacherEvaluate> teacherEvaluates;
//        if (semesterId != null) {
//            students = studentService.getStudentsBySemester(semesterId);
//            teacherEvaluates = teacherEvaluateService.getTeacherEvaluatesBySemester(semesterId);
//        } else {
//            // ถ้าไม่มีการเลือก semester ใช้รายการทั้งหมด
//            students = studentService.getAllStudents();
//            teacherEvaluates = teacherEvaluateService.getTeacherEvaluate();
//        }
//
//        model.addAttribute("list_students", students);
//        model.addAttribute("list_teacherEvaluates", teacherEvaluates);
//        model.addAttribute("semester", semesters);
//
//        return "coordinator/view_summary";
//    }

    @GetMapping("/semester")
    public  String semesterPage(Model model, HttpSession session){
//        List<String> strings  = teacherEvaluateService.getAllListSemester();

//        model.addAttribute("list_semester", s );
        return "coordinator/view_summary";
    }

    @RequestMapping("/view_summary")
    public String gotoSummaryPage (Model model) {
        List<String> semesters  = teacherEvaluateService.getAllListSemester();
        System.out.println("---------------------------------------------"+semesters);
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

//        @GetMapping("/view_summary")
//    public String gotoSummaryPage(Model model ) {
//        List<String> strings = teacherEvaluateService.getAllListSemester();
//        System.out.println();
//        List<Student> students = studentService.getAllStudents();
//        List<TeacherEvaluate> teacherEvaluates = teacherEvaluateService.getTeacherEvaluate();
//        Session session = null;
//        try  {
//            session = sessionFactory.openSession();
//            for (Student student : students) {
//                // ดึงข้อมูล TeacherEvaluates และคำนวณคะแนนรวม
//                Hibernate.initialize(student.getTeacherEvaluates());
//            }
//        }
//        catch (Exception e) {
//            // จัดการข้อผิดพลาด
//        } finally {
//            if (session != null && session.isOpen()) {
//                session.close(); // ปิดเซสชัน
//            }
//        }
////        model.addAttribute("list_semester", strings);
//        model.addAttribute("list_students", students);
//        model.addAttribute("list_teacherEvaluates",teacherEvaluates);
//        return "coordinator/view_summary";
//    }

//    @GetMapping("/view_summary")
//    public String gotoSummaryPage(@RequestParam(name = "selectedSemester", required = false) String selectedSemester, Model model) {
//        // ดึงรายการนักศึกษา
//        List<Student> students = studentService.getAllStudents();
//
//        // สร้าง List สำหรับเก็บ semester ที่คุณจะแสดงใน dropdown
//        List<String> semesters = new ArrayList<>();
//
//        // วนลูปผ่านรายการนักศึกษาเพื่อเพิ่ม semester ลงใน List
//        for (Student student : students) {
//            String semester = student.getSemester();
//            if (!semesters.contains(semester)) {
//                semesters.add(semester);
//            }
//        }
//
//        // ส่งรายการนักศึกษาและรายการ semester ไปยังหน้า view ผ่าน model
//        model.addAttribute("list_students", students);
//        model.addAttribute("list_semesters", semesters);
//
//        // ส่ง semester ที่ผู้ใช้เลือกใน dropdown ไปยังหน้า view
//        model.addAttribute("selectedSemester", selectedSemester);
//
//        return "coordinator/view_summary";
//    }



//    @RequestMapping(value = "/ViewExportSummaryReport" , method = RequestMethod.GET)
//    public String ViewExportSummaryReport(HttpServletRequest  request ,HttpSession session) {
//
//        ListStudentDB ListStu = new ListStudentDB();
//        teacherManager ListTM = new teacherManager();
//        String searchDate = request.getParameter("getsemester");
//
//
//        List<String> semesterList =  ListStu.AllListsemester();
//        List<Student> StuSemester = ListStu.AllListStuSemester(searchDate);
//        List<teacher> teacherList =  ListTM.SearchteacherALL();
//
//        session.setAttribute("StuSemester", StuSemester);
//        session.setAttribute("teacherList", teacherList);
//        session.setAttribute("getSemester", searchDate);
//
//        return "ExportSummaryReport";
//    }

}
