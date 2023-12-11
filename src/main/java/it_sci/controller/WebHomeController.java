package it_sci.controller;

import it_sci.model.Student;
import it_sci.model.Teacher;
import it_sci.service.StudentService;
import it_sci.service.TeacherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class WebHomeController {
    @Autowired
    private TeacherService teacherService;

    @Autowired
    private StudentService studentService;

    @RequestMapping("/")
    public String gotoWebIndex (Model model) {
        model.addAttribute("stt","false");
        return "index";
    }
}
