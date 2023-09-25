package it_sci.dao;

import it_sci.model.Company;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class CompanyDaoImpl implements CompanyDao {

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public List<Company> getAllCompanies() {
        Session session = sessionFactory.getCurrentSession();
        Query<Company> query = session.createQuery("FROM Company", Company.class);
        List<Company> companies = query.getResultList();
        return companies;
    }

    @Override
    public Company getCompanyById(int company_id) {
        Session session = sessionFactory.getCurrentSession();
        Query<Company> query = session.createQuery("FROM Company c WHERE c.company_id =: cId", Company.class);
        query.setParameter("cId", company_id);
        return query.getSingleResult();
    }

    @Override
    public Company getCompany(int company_id) {
        Session session = sessionFactory.getCurrentSession();
        Company company = session.get(Company.class,company_id );
        return company;
    }

    @Override
    public void saveCompany(Company company) {
        Session session = sessionFactory.getCurrentSession();
        session.save(company);
    }

    @Override
    public void updateCompany(Company company) {
        Session session = sessionFactory.getCurrentSession();
        session.update(company);
    }

    @Override
    public void deleteCompany(int company_id) {
        Session session = sessionFactory.getCurrentSession();
        Query<Company> query = session.createQuery("FROM Company c WHERE c.company_id =: cId", Company.class);
        query.setParameter("cId", company_id);
        Company company = query.getSingleResult();
        session.remove(company);
    }
}
