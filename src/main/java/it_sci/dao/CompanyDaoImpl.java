package it_sci.dao;

import it_sci.model.Company;
import it_sci.model.Student;
import it_sci.model.TeacherEvaluate;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.Date;
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
    public List<Company> getCompaniesByStudentSemester(String semester, int teacher_id) {
        Session session = sessionFactory.getCurrentSession();
        Query<Company> query = session.createQuery("SELECT DISTINCT c " +
                "FROM  Company c " +
                "JOIN Student s ON c.company_id = s.company.company_id " +
                "JOIN TeacherEvaluate te ON s.student_id = te.student.student_id "+
                "WHERE s.semester = :sem and te.teacher.teacher_id =: teacherId ", Company.class);
        query.setParameter("sem", semester);
        query.setParameter("teacherId", teacher_id);
        return query.getResultList();
    }

    @Override
    public List<TeacherEvaluate> getListTeacherEvaluate() {
        Session session = sessionFactory.getCurrentSession();
        Query<TeacherEvaluate> query = session.createQuery("SELECT DISTINCT te FROM TeacherEvaluate te " +
                "JOIN Student s ON te.student.student_id = s.student_id " +
                "join Company c on s.company.company_id = c.company_id " +
                "group by c.company_id ", TeacherEvaluate.class);
        return query.getResultList();

//        Query<TeacherEvaluate> query = session.createQuery("SELECT DISTINCT te FROM TeacherEvaluate te " +
//                "join Teacher t on te.teacher.teacher_id = t.teacher_id " +
//                "join Student s on t.teacher_id = s.teacher.teacher_id " +
//                "join Company c on s.company.company_id = c.company_id", TeacherEvaluate.class);
    }

    @Override
    public List<Company> getListCompanyBySemester(String semester) {
        Session session = sessionFactory.getCurrentSession();
        Query<Company> query = session.createQuery(
                "select distinct c from Company c " +
                        "join Student s on c.company_id = s.company.company_id " +
                        "where s.semester =: sem", Company.class
        );
        query.setParameter("sem", semester);


        System.out.println(query.getResultList().size());
        return query.getResultList();
    }

    @Override
    public TeacherEvaluate getUpdateAssignTeacher(int company_id) {
        Session session = sessionFactory.getCurrentSession();
        Query<TeacherEvaluate> query = session.createQuery("SELECT DISTINCT te FROM TeacherEvaluate te " +
                "JOIN Student s ON te.student.student_id = s.student_id " +
                "join Company c on s.company.company_id = c.company_id " +
                "WHERE c.company_id =: cId ", TeacherEvaluate.class);
        query.setParameter("cId", company_id);
        List<TeacherEvaluate> results = query.getResultList();

        if (results.isEmpty()) {
            // จากการค้นหาเราไม่พบข้อมูลนักเรียนที่ตรงกับ ID
            System.out.println("Not found data at : " + company_id);
            return null;
        } else {
            // มีข้อมูลนักเรียนที่ตรงกับ ID คืนค่าข้อมูลนักเรียนนี้
            System.out.println("companyname " + results.get(0).getStudent().getCompany().getCompany_name());
            return results.get(0);
        }
    }

    @Override
    public TeacherEvaluate getCompanyAssign(int company_id, Date teacher_super_vision_date, String teacher_super_vision_time, int teacher_id) {
        Session session = sessionFactory.getCurrentSession();
        Query<TeacherEvaluate> query = session.createQuery("UPDATE TeacherEvaluate te " +
                "SET te.teacher.teacher_id = :tId, " +
                "te.teacher_super_vision_date = :dateVision, " +
                "te.teacher_super_vision_time = :timeVision " +
                "WHERE te.student.student_id IN (SELECT s.student_id FROM Student s WHERE s.company.company_id = :cId)", TeacherEvaluate.class);
        query.setParameter("cId", company_id);
        query.setParameter("dateVision", teacher_super_vision_date);
        query.setParameter("timeVision", teacher_super_vision_time);
        query.setParameter("tId", teacher_id);
        query.executeUpdate(); // ใช้ executeUpdate() สำหรับคำสั่ง UPDATE
        // หากคุณต้องการคืนข้อมูลหลังการอัปเดต คุณสามารถทำแบบนี้
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
