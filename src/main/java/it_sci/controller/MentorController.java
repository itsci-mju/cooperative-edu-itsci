package it_sci.controller;

import it_sci.model.*;
import it_sci.service.MentorEvaluateService;
import it_sci.service.MentorService;
import it_sci.service.StudentService;
import it_sci.utils.ImgPath;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.transaction.Transactional;
import javax.validation.Valid;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
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
        List<MentorEvaluate> mentorEvaluates = mentorEvaluateService.getMentorEvaluateByMentorId(mentor_id);
        List<Mentor> mentors1 = mentorService.getListStudentByMenterId(mentor_id);
        model.addAttribute("mentorEvaluates",mentorEvaluates);
        model.addAttribute("mentors", mentors1);
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
    public String updateMentor(@PathVariable("id") int mentor_id,
                               @RequestParam ("profile") MultipartFile img,
                               @RequestParam (value = "original_file", required = false) String original_file,
                               @RequestParam Map<String, String> allReqParams) throws ParseException, IOException {
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
//

            String ImgPath = it_sci.utils.ImgPath.pathUploads + "/mentor_profile/";

            Path path1 = Paths.get(ImgPath,original_file);
            if (original_file != null){
                if (Files.exists(path1)){
                    Files.delete(path1);
                }
            }

            Path directoryPathIMG = Paths.get(ImgPath);
            Files.createDirectories(directoryPathIMG);

            String originalFileName = img.getOriginalFilename();
            String fileExtension = getFileExtension(originalFileName);

            String newFileName = String.format("MentorProfile_%04d%s", mentor_id, fileExtension);

            Path imgFilePath = Paths.get(ImgPath, newFileName);
            Files.write(imgFilePath, img.getBytes());

            mentor.setMentor_image(newFileName);

            mentorService.updateMentor(mentor);


        }
        return "redirect:/";
    }

    private String getFileExtension(String fileName) {
        int dotIndex = fileName.lastIndexOf('.');
        if (dotIndex > 0 && dotIndex < fileName.length() - 1) {
            return fileName.substring(dotIndex);
        }
        return "";
    }

    @Transactional
    @PostMapping("/submit_evaluate_by_mentor/{mentor_id}")
    public String submitEvaluateByMentor (@RequestParam Map<String, String> map, @PathVariable("mentor_id") int mentor_id) {
        int sumScore = 0;
        String radioAnswer = "";
        for (int i = 0; i < 11; i++) {
            int score = Integer.parseInt(map.get("score" + (i + 1)));
            String radio = map.get("score"+(i+1));
            sumScore += score;
            radioAnswer = radioAnswer + radio + ",";

        }
        Mentor mentor = mentorService.getMentorById(mentor_id);
        String student_id = map.get("studentId");
        Student student = studentService.getStudentById(student_id);
        Date assessment_date = new Date();

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
        Session currentSession = sessionFactory.getCurrentSession();
        mentorEvaluate = (MentorEvaluate) currentSession.merge(mentorEvaluate);

        String answerText1 = map.get("answerText1");
        String answerText2 = map.get("answerText2");
        String answerText3 = map.get("answerText3");
        String answerText4 = map.get("answerText4");
        String answerText5 = map.get("answerText5");

        String answerTextTotal = answerText1 +","+ answerText2 +","+ answerText3 +","+ answerText4 +","+ answerText5;

        MentorEvaluate mentorEvaluate1 = mentorEvaluateService.getMentorEvaluateById(mentorEvaluate.getAssessment_id());
        MentorAnswer mentorAnswer = new MentorAnswer(answerTextTotal,radioAnswer,mentorEvaluate1);
//        mentorEvaluateService.saveMentorEvaluate(mentorEvaluate);
        mentorAnswer = (MentorAnswer) currentSession.merge(mentorAnswer);

        return "redirect:/mentor/list_student_by_mentor/"+mentor_id;
    }

    @GetMapping("edit_password/{mentor_id}")
    public String EditMentorPassword(@PathVariable("mentor_id") int id, Model model) {
        model.addAttribute("mentor", mentorService.getMentorById(id));

        return "mentor/edit_password";
    }

    @PostMapping("/save_mentor_password/{mentor_id}")
    public String updateMentorPassword(@RequestParam Map<String, String> map, @PathVariable("mentor_id") int id) {
        BCryptPasswordEncoder bCryptPasswordEncoder = new BCryptPasswordEncoder();
        Mentor mentor = mentorService.getMentorById(id);
        if (mentor != null) {
            mentor.setPassword(bCryptPasswordEncoder.encode(map.get("password")));
            mentorService.updateMentorPassword(mentor);
        }
        return "redirect:/mentor/"+id+"/edit_profile";
    }



}
