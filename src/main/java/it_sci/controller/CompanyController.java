package it_sci.controller;

import it_sci.model.Company;
import it_sci.service.CompanyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
        return "coordinator/list_company";
    }

//    @RequestMapping("/list_company_supervision")
//    public String gotoCompany (Model model) {
//        List<Company> company = companyService.getAllCompanies();
//        model.addAttribute("companies", company);
//        return "coordinator/list_company";
//    }
}
