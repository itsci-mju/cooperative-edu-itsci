package it_sci.service;

import it_sci.model.Company;
import it_sci.model.TeacherEvaluate;

import java.util.List;

public interface CompanyService {

    List<Company> getAllCompanies();
    Company getCompanyById(int company_id);
    Company getCompany(int company_id);
    List<Company> getCompaniesByStudentSemester(String semester,int teacher_id);
    List<TeacherEvaluate> getListTeacherEvaluate();
    void saveCompany(Company company);
    void updateCompany(Company company);
    void deleteCompany(int company_id);

}
