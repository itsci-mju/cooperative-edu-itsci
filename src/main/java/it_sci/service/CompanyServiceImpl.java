package it_sci.service;

import it_sci.dao.CompanyDao;
import it_sci.model.Company;
import it_sci.model.TeacherEvaluate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class CompanyServiceImpl implements CompanyService {

    @Autowired
    private CompanyDao companyDao;

    @Override
    @Transactional
    public List<Company> getAllCompanies() {
        return companyDao.getAllCompanies();
    }

    @Override
    @Transactional
    public Company getCompanyById(int company_id) {
        return companyDao.getCompanyById(company_id);
    }

    @Override
    @Transactional
    public Company getCompany(int company_id) {
        return companyDao.getCompany(company_id);
    }

    @Override
    @Transactional
    public List<Company> getCompaniesByStudentSemester(String semester, int teacher_id) {
        return companyDao.getCompaniesByStudentSemester(semester,teacher_id);
    }

    @Override
    @Transactional
    public List<TeacherEvaluate> getListTeacherEvaluate() {
        return companyDao.getListTeacherEvaluate();
    }

    @Override
    @Transactional
    public void saveCompany(Company company) {
        companyDao.saveCompany(company);
    }

    @Override
    @Transactional
    public void updateCompany(Company company) {
        companyDao.updateCompany(company);
    }

    @Override
    @Transactional
    public void deleteCompany(int company_id) {
        companyDao.deleteCompany(company_id);
    }
}
