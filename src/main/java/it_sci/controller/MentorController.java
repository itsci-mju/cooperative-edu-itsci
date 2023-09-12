package it_sci.controller;

import it_sci.model.FormMentorEvaluateItem;
import it_sci.model.Mentor;
import it_sci.model.MentorEvaluate;
import it_sci.model.Student;
import it_sci.service.MentorEvaluateService;
import it_sci.service.MentorService;
import it_sci.service.StudentService;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.transaction.Transactional;
import java.text.ParseException;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/mentor")
public class MentorController {

    @Autowired
    private MentorService mentorService;

    @Autowired
    private StudentService studentService;

    @Autowired
    private MentorEvaluateService mentorEvaluateService;

    @Autowired
    private SessionFactory sessionFactory;

    @RequestMapping("/list_student_by_mentor/{mentor_id}")
    public String gotoListStudentPage (Model model, @PathVariable("mentor_id") int mentor_id) {
        List<MentorEvaluate> mentors = mentorEvaluateService.getMentorEvaluateByMentorId(mentor_id);
        model.addAttribute("mentors", mentors);
//        List<Student> students = mentorService.getMentorDoesNotHaveStudent(21);
//        System.out.println(students.size());
//        model.addAttribute("students",students);
//        System.out.println(students.size());
        return "mentor/list_student";
    }

    @RequestMapping("/list_evaluate_by_mentor/{mentor_id}")
    public String gotoListEvaluatePage (Model model, @PathVariable("mentor_id") int mentor_id) {
        List<MentorEvaluate> mentorEvaluate = mentorEvaluateService.getMentorEvaluateByMentorId(mentor_id);
        model.addAttribute("mentorevaluate", mentorEvaluate);
//        List<Student> students = mentorService.getMentorDoesNotHaveStudent(21);
//        System.out.println(students.size());
//        model.addAttribute("students",students);
//        System.out.println(students.size());
        return "mentor/list_evaluate";
    }

    @GetMapping("/{student_id}/evaluate/{mentor_id}")
    public String gotoEvaluatePage (@PathVariable("student_id") String student_id, Model model,@PathVariable("mentor_id") int mentor_id,  HttpServletRequest request) {
        request.setAttribute("mentor", mentorService.getMentorById(mentor_id));
        model.addAttribute("student", studentService.getStudentById(student_id));
        model.addAttribute("mentor_evaluate_item", new MentorEvaluate());
        return "mentor/evaluate";
    }

    @GetMapping("/{mentor_id}/edit_profile")
    public String gotoEditProfile (@PathVariable("mentor_id") int mentor_id, Model model) {
        Mentor mentor = mentorService.getMentorById(mentor_id);
        model.addAttribute("mentor_profile", mentor);
        return "mentor/editprofile";
    }


    @PostMapping (path="/{id}/update_mentor_profile")
    public String updateMentor(@PathVariable("id") int mentor_id,@RequestParam Map<String, String> allReqParams) throws ParseException {
        Mentor mentor = mentorService.getMentorById(mentor_id);
        if (mentor != null) {
            mentor.setMentor_name(allReqParams.get("mentor_name"));
            mentor.setMentor_lastname(allReqParams.get("mentor_lastname"));
            mentor.setMentor_nickname(allReqParams.get("mentor_nickname"));
            mentor.setMentor_position(allReqParams.get("mentor_position"));
            mentor.setPhone_number(allReqParams.get("phone_number"));
            mentor.setMentor_line(allReqParams.get("mentor_line"));
            mentor.setMentor_email(allReqParams.get("mentor_email"));
            mentor.setPassword(allReqParams.get("password"));
            mentorService.updateMentor(mentor);
        }
        return "redirect:/";
    }

    @Transactional
    @PostMapping("/submit_evaluate_by_mentor/{mentor_id}")
    public String submitEvaluateByMentor (@RequestParam Map<String, String> map, @PathVariable("mentor_id") int mentor_id) {
        int sumScore = 0;
        for (int i = 0; i < 11; i++) {
            int score = Integer.parseInt(map.get("score" + (i + 1)));
            sumScore += score;
        }
        Mentor mentor = mentorService.getMentorById(mentor_id);
        String student_id = map.get("studentId");
        Student student = studentService.getStudentById(student_id);
//        System.out.println(sumScore);

        //String assessment_id = "ME0000006";

        Date assessment_date = new Date();

//        String student_id = map.get("studentId");
//        Student student = studentService.getStudentById(student_id);

        Date assessment_startdate = student.getEnddate();

        Calendar calendar = Calendar.getInstance();
        calendar.setTime(assessment_startdate);
        calendar.add(Calendar.DAY_OF_MONTH, 1);

        Date assessment_startdate_fin = calendar.getTime();

        Calendar calendar2 = Calendar.getInstance();
        calendar2.setTime(assessment_startdate_fin);
        calendar2.add(Calendar.DAY_OF_MONTH, 7);

        Date assessment_enddate = calendar2.getTime();

        String assessment_status = "ประเมินแล้ว";


        System.out.println("STUDENT ID : " + student.getTeacher().getTeacher_id());

//        Mentor mentor = mentorService.getMentorById(1);

        MentorEvaluate mentorEvaluate = new MentorEvaluate(sumScore, assessment_date, assessment_startdate_fin, assessment_enddate, assessment_status,student, mentor);

//        mentorEvaluateService.saveMentorEvaluate(mentorEvaluate);
        Session currentSession = sessionFactory.getCurrentSession();
        mentorEvaluate = (MentorEvaluate) currentSession.merge(mentorEvaluate);


        return "redirect:/mentor/list_student_by_mentor/";
    }

    @RequestMapping("/view_summary")
    public String gotoSummaryPage (Model model) {
        List<Student> students = studentService.getAllStudents();
        model.addAttribute("list_students", students);
        return "coordinator/view_summary";
    }
}
