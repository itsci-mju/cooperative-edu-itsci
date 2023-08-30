package it_sci.dao;

import it_sci.model.Company;

import java.util.List;

public interface CompanyDao {

    List<Company> getAllCompanies();
    Company getCompanyById(int company_id);

    Company getCompany(int id);

//    List<Company> getCompanies();
    void saveCompany(Company company);
    void updateCompany(Company company);
    void deleteCompany(int company_id);

}
