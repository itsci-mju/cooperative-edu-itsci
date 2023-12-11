package it_sci.controller;

import it_sci.model.*;
import it_sci.service.MentorEvaluateService;
import it_sci.service.MentorService;
import it_sci.service.StudentService;
import it_sci.utils.ImgPath;
import org.apache.poi.ss.usermodel.*;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.transaction.Transactional;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.ParseException;
import java.util.*;

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

    public MentorController() throws IOException {
    }


    @GetMapping("/{mentor_id}/select_semester_list_student_by_mentor")
    public String getSelectSemesterListStudent(HttpServletRequest request, Model model, @PathVariable int mentor_id){
        String term = request.getParameter("semesterSelect");
        List<Mentor> mentor = mentorService.getMentorByIdAndStuId(mentor_id, term);
        List<Mentor> newMentor = new ArrayList<>();
        for (Mentor mentor1 : mentor) {
            for (Student student : mentor1.getStudents()) {
                if (Objects.equals(student.getSemester(), term)) {
                    newMentor.add(mentor1);
                }
            }
        }

        model.addAttribute("term", term);
        model.addAttribute("list_semester", mentorEvaluateService.getAllListSemester());
        model.addAttribute("mentors", newMentor);

        return "mentor/list_student";
    }
    @RequestMapping("/list_student_by_mentor/{mentor_id}")
    public String gotoListStudentPage (Model model, @PathVariable("mentor_id") int mentor_id,HttpServletRequest request) {
        List<String> semesters  = mentorEvaluateService.getAllListSemester();
        List<MentorEvaluate> mentorEvaluates = mentorEvaluateService.getMentorEvaluateByMentorId(mentor_id);

        String term = mentorEvaluateService.getAllListSemester().get(0);

        model.addAttribute("term", term);

        List<Mentor> mentors1 = mentorService.getMentorByIdAndStuId(mentor_id,term);

//        model.addAttribute("mentorEvaluates", mentorEvaluateService.getMentorEvaluateById(Long.parseLong(mentorEvaluateService.getAllListSemester().get(0))));
        model.addAttribute("mentorEvaluates",mentorEvaluates);
        model.addAttribute("mentors", mentors1);
        System.out.println("Size : " + mentors1);
        model.addAttribute("list_semester", semesters);
        return "mentor/list_student";
    }

    @GetMapping("/{mentor_id}/select_semester_list_mentor_evaluate")
    public String getSelectSemesterListMentorEvaluate(HttpServletRequest request, Model model, @PathVariable String mentor_id){
        String term = request.getParameter("semesterSelect");

        model.addAttribute("term", term);
        model.addAttribute("list_semester", mentorEvaluateService.getAllListSemester());
        model.addAttribute("list_mentor_evaluate", mentorEvaluateService.getListMentorEvaluateBySemester(term));
        return "mentor/list_evaluate";
    }
    @RequestMapping("/list_evaluate_by_mentor/{mentor_id}")
    public String gotoListEvaluatePage (Model model, @PathVariable("mentor_id") int mentor_id) {
        List<String> semesters  = mentorEvaluateService.getAllListSemester();
        List<MentorEvaluate> mentorEvaluate = mentorEvaluateService.getMentorEvaluateByMentorId(mentor_id);

        model.addAttribute("list_mentor_evaluate", mentorEvaluateService.getListMentorEvaluateBySemester(mentorEvaluateService.getAllListSemester().get(0)));
        model.addAttribute("list_semester", semesters);
        return "mentor/list_evaluate";
    }

    @GetMapping("/{student_id}/evaluate/{mentor_id}")
    public String gotoEvaluatePage (@PathVariable("student_id") String student_id, Model model,@PathVariable("mentor_id") int mentor_id,  HttpServletRequest request) {
        request.setAttribute("mentor", mentorService.getMentorById(mentor_id));
        model.addAttribute("student", studentService.getStudentById(student_id));
        model.addAttribute("mentor_evaluate_item", new MentorEvaluate());
        model.addAttribute("stt","false");
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
                               @RequestParam ("mentor_profile") MultipartFile img,
                               @RequestParam (value = "original_file", required = false) String original_file,
                               @RequestParam Map<String, String> allReqParams,HttpServletRequest request, Model model) throws IOException {
        Mentor mentor = mentorService.getMentorById(mentor_id);
        if (mentor != null) {
            mentor.setMentor_name(allReqParams.get("mentor_name"));
            mentor.setMentor_lastname(allReqParams.get("mentor_lastname"));
            mentor.setMentor_nickname(allReqParams.get("mentor_nickname"));
            mentor.setMentor_position(allReqParams.get("mentor_position"));
            mentor.setPhone_number(allReqParams.get("phone_number"));
            mentor.setMentor_line(allReqParams.get("mentor_line"));
            mentor.setMentor_email(allReqParams.get("mentor_email"));
            mentor.setMentor_facebook(allReqParams.get("mentor_facebook"));
//

//            String ImgPath = it_sci.utils.ImgPath.pathUploads + "/mentor_profile/";
            String imgProfilePath = request.getSession().getServletContext().getRealPath("/") + "//uploads//mentor_profile//";

            Path path1 = Paths.get(imgProfilePath,original_file);
            if (original_file != null){
                if (Files.exists(path1)){
                    Files.delete(path1);
                }
            }

            Path directoryPathIMG = Paths.get(imgProfilePath);
            Files.createDirectories(directoryPathIMG);

            String originalFileName = img.getOriginalFilename();
            String fileExtension = getFileExtension(originalFileName);

            String newFileName = String.format("MentorProfile_%04d%s", mentor_id, fileExtension);

            Path imgFilePath = Paths.get(imgProfilePath, newFileName);
            Files.write(imgFilePath, img.getBytes());

            mentor.setMentor_image(newFileName);

            mentorService.updateMentor(mentor);
            model.addAttribute("stt","true");

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
    public String submitEvaluateByMentor (@RequestParam Map<String, String> map, HttpServletRequest request,Model model, @PathVariable("mentor_id") int mentor_id) {
        int sumScore = 0;
        String radioAnswer = "";
        for (int i = 0; i < 11; i++) {
            int score = Integer.parseInt(map.get("score" + (i + 1)));
            String radio = map.get("score"+(i+1));
            sumScore += score;
            radioAnswer = radioAnswer + radio + ",";

        }
        Mentor mentor = mentorService.getMentorById(mentor_id);
        System.out.println("mentor " + mentor.getMentor_id());
        String student_id = map.get("studentId");
        String studentId = request.getParameter("stdId");
        System.out.println("studentId :" + studentId);


        try{
            Student student = studentService.getStudentById(studentId);

            Date assessment_date = new Date();
            Date assessment_startdate = student.getEnddate();

            Calendar calendar = Calendar.getInstance();
            calendar.setTime(assessment_startdate);
            calendar.add(Calendar.DAY_OF_MONTH, 1);
            Date assessment_startdate_fin = calendar.getTime();

            Calendar calendar2 = Calendar.getInstance();
            calendar2.setTime(assessment_startdate_fin);
            calendar2.add(Calendar.DAY_OF_MONTH, 7);

            MentorEvaluate mentorEvaluate = new MentorEvaluate(sumScore, assessment_date, assessment_startdate_fin, calendar2.getTime(), "ประเมินแล้ว",student, mentor);

            Session currentSession = sessionFactory.getCurrentSession();
            mentorEvaluate = (MentorEvaluate) currentSession.merge(mentorEvaluate);

            String answerText1 = map.get("answerText1");
            String answerText2 = map.get("answerText2");
            String answerText3 = map.get("answerText3");
            String answerText4 = map.get("answerText4");
            String answerText5 = map.get("answerText5");



            MentorEvaluate mentorEvaluate1 = mentorEvaluateService.getMentorEvaluateById(mentorEvaluate.getAssessment_id());
            MentorAnswer mentorAnswer = new MentorAnswer(answerText1,answerText2,answerText3,answerText4,answerText5,radioAnswer,mentorEvaluate1);
            System.out.println("answerText1 : " + answerText1);
            System.out.println("answerText1 : " + answerText2);
            System.out.println("answerText1 : " + answerText3);
            System.out.println("answerText1 : " + answerText4);
            System.out.println("answerText1 : " + answerText5);
            System.out.println("radioAnswer : " + radioAnswer);
            System.out.println("mentorEvaluate1 : " + mentorEvaluate1);

            mentorEvaluateService.saveMentorEvaluate(mentorEvaluate);
            mentorEvaluateService.saveMentorAnswer(mentorAnswer);


            mentorAnswer = (MentorAnswer) currentSession.merge(mentorAnswer);
            model.addAttribute("stt","true");
//            System.out.println("Pass !!!");

        }catch (Exception e){
            System.out.println("Fail !!!");

        }
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

