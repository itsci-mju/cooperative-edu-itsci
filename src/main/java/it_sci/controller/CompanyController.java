package it_sci.controller;

import it_sci.model.Company;
import it_sci.service.CompanyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/company")
public class CompanyController {

    @Autowired
    private CompanyService companyService;

    @RequestMapping("/list_company")
    public String gotoTest (Model model) {
        List<Company> company = companyService.getAllCompanies();
        model.addAttribute("companies", company);
        model.addAttribute("list_evaluate" ,companyService.getListTeacherEvaluate());
        return "coordinator/list_company";
    }

    @GetMapping("/{id}/view_company_detail")
    public String GetCompany(@PathVariable("id") int id, Model model){
        Company company = companyService.getCompany(id);
        model.addAttribute("company_detail",company);
        return "teacher/company_detail";
    }

//    @RequestMapping("/list_company_supervision")
//    public String gotoCompany (Model model) {
//        List<Company> company = companyService.getAllCompanies();
//        model.addAttribute("companies", company);
//        return "coordinator/list_company";
//    }
}
