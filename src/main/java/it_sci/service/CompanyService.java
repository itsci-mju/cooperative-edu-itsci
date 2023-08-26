package it_sci.service;

import it_sci.model.Company;

import java.util.List;

public interface CompanyService {

    List<Company> getAllCompanies();
    Company getCompanyById(int company_id);
    void saveCompany(Company company);
    void updateCompany(Company company);
    void deleteCompany(int company_id);

}
