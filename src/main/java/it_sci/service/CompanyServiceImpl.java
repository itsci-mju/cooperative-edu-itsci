package it_sci.service;

import it_sci.dao.CompanyDao;
import it_sci.model.Company;
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
