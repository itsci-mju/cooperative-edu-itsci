package it_sci.controller;
import it_sci.model.Mentor;
import it_sci.model.Teacher;
import it_sci.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.util.Map;

@Controller
public class LoginController {

    @Autowired
    private UserService userService;

    @PostMapping("doLoginMentor")
    public String doLoginMentor (@RequestParam Map<String, String> map, Model model, HttpSession session) {
        String email = map.get("email");
        String password = map.get("password");
        Mentor mentor = userService.loginMentor(email,password);

        if (mentor != null) {
            session.setAttribute("mentor", mentor);
            return "redirect:/";
        }else {
            model.addAttribute("loginFailed", true);
            return "redirect:/access-denied";
        }

    }

    @GetMapping("/loginMentor")
    public String loginPageMentor(Model model) {
        model.addAttribute("title", "เข้าสู่ระบบสำหรับพนักงานพี่เลี้ยง");
        return "mentor/login";
    }

    @PostMapping("doLoginTeacher")
    public String doLoginTeacher (@RequestParam Map<String, String> map, Model model, HttpSession session) {
        String email = map.get("email");
        String password = map.get("password");
        Teacher teacher = userService.loginTeacher(email,password);

        if (teacher != null) {
            session.setAttribute("teacher", teacher);
            return "redirect:/";
        }else {
            model.addAttribute("loginFailed", true);
            return "redirect:/access-denied";
        }

    }

    @GetMapping("/loginTeacher")
    public String loginPageTeacher(Model model) {
        model.addAttribute("title", "เข้าสู่ระบบสำหรับอาจารย์");
        return "teacher/login";
    }

    @GetMapping("/access-denied")
    public String showAccessDenied(Model model) {
        model.addAttribute("title", "Access Denied");
        return "access-denied";
    }

    @RequestMapping("/doLogout")
    public String doLogout (HttpSession session) {
        session.setAttribute("mentor", null);
        session.setAttribute("teacher", null);
        return "redirect:/";
    }
}
