package it_sci.dao;

import it_sci.model.Student;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class StudentDaoImpl implements StudentDao {

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public List<Student> getAllStudents() {
        Session session = sessionFactory.getCurrentSession();
        Query<Student> query = session.createQuery("FROM Student", Student.class);
//        Query<Student> query = session.createQuery("SELECT s FROM Student s LEFT JOIN FETCH s.teacherEvaluateslist ", Student.class);
        return query.getResultList();
    }

    @Override
    public Student getStudentById(String student_id) {
        Session session = sessionFactory.getCurrentSession();
        System.out.println("student_id : " + student_id);
        Query<Student> query = session.createQuery("FROM Student s WHERE s.student_id = :sId", Student.class);
        query.setParameter("sId", student_id);

        System.out.println(query.getResultList().size());
        return query.getSingleResult();
//        List<Student> results = query.getResultList();
//
//        if (results.isEmpty()) {
//            // จากการค้นหาเราไม่พบข้อมูลนักเรียนที่ตรงกับ ID
//            System.out.println("Not found data at : " + student_id);
//            return null;
//        } else {
//            // มีข้อมูลนักเรียนที่ตรงกับ ID คืนค่าข้อมูลนักเรียนนี้
//            return results.get(0);
//        }
    }


    @Override
    public List<Student> getStudentByCompanyId(int company_id, String Fterm) {
        Session session = sessionFactory.getCurrentSession();
        Query<Student> query = session.createQuery("FROM Student s WHERE s.company.id =: cId AND s.semester =: fTerm", Student.class);
        query.setParameter("cId", company_id);
        query.setParameter("fTerm" , Fterm);
        return query.getResultList();
    }

    @Override
    public void saveStudent(Student student) {
        Session session = sessionFactory.getCurrentSession();
        session.save(student);
    }

    @Override
    public void updateStudent(Student student) {
        Session session = sessionFactory.getCurrentSession();
        session.update(student);
    }

    @Override
    public void deleteStudent(String student_id) {
        Session session = sessionFactory.getCurrentSession();
        Query<Student> query = session.createQuery("FROM Student s WHERE s.student_id =: sId", Student.class);
        query.setParameter("sId", student_id);
        Student student = query.getSingleResult();
        session.remove(student);
    }

    @Override
    public List<Student> getStudentsBySemester(String semester) {
        Session session = sessionFactory.getCurrentSession();
        Query<Student> query = session.createQuery("FROM Student s LEFT JOIN FETCH s.teacherEvaluateslist WHERE s.semester =: sem ", Student.class);
        query.setParameter("sem", semester);
        return query.getResultList();
    }

    @Override
    public List<Student> getListStudentsBySemester(String semester) {
        Session session = sessionFactory.getCurrentSession();
        Query<Student> query = session.createQuery("FROM Student s LEFT JOIN FETCH s.teacherEvaluateslist " +
                "WHERE s.semester =: sem ", Student.class);

        query.setParameter("sem", semester);
        return query.getResultList();
    }

    @Override
    public List<Student> getListStudents() {
        Session session = sessionFactory.getCurrentSession();
        Query<Student> query = session.createQuery("FROM Student s LEFT JOIN FETCH s.teacherEvaluateslist ORDER BY s.student_id ASC " , Student.class);

        return query.getResultList();
    }

    @Override
    public List<Student> getListStudentsByTerm(String semester) {
        Session session = sessionFactory.getCurrentSession();
        Query<Student> query = session.createQuery("FROM Student s LEFT JOIN FETCH s.teacherEvaluateslist where s.semester =: sem ORDER BY s.student_id ASC " , Student.class);

        query.setParameter("sem", semester);
        return query.getResultList();
    }
}
