package it_sci.dao;

import it_sci.model.Company;
import it_sci.model.TeacherEvaluate;

import java.util.List;

public interface CompanyDao {

    List<Company> getAllCompanies();
    Company getCompanyById(int company_id);

    List<Company> getCompaniesByStudentSemester(String semester,int teacher_id);
    List<TeacherEvaluate> getListTeacherEvaluate();

    Company getCompany(int id);

//    List<Company> getCompanies();
    void saveCompany(Company company);
    void updateCompany(Company company);
    void deleteCompany(int company_id);

}
