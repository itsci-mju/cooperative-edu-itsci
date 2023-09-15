package it_sci.controller;


import it_sci.model.*;
import it_sci.service.*;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.transaction.Transactional;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;

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

//    @RequestMapping("/list_student_by_mentor")
//    public String gotoListStudentPage (Model model) {
//        Mentor mentor = mentorService.getMentorById(6);
//        model.addAttribute("students", mentor.getStudents());
//        System.out.println(mentor.getStudents().size());
//        return "mentor/list_student";
//    }
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


}
