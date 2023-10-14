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
        Query<Student> query = session.createQuery("SELECT s FROM Student s LEFT JOIN FETCH s.teacherEvaluateslist", Student.class);
        System.out.println("," + query.getResultList());
        List<Student> students = query.getResultList();
        return students;
    }

    @Override
    public Student getStudentById(String student_id) {
//        Session session = sessionFactory.getCurrentSession();
//        Query<Student> query = session.createQuery("FROM Student s WHERE s.student_id =: sId", Student.class);
//        query.setParameter("sId", student_id);
//        Student student = query.getSingleResult();
//
        Session session = sessionFactory.getCurrentSession();
        Query<Student> query = session.createQuery("FROM Student s WHERE s.student_id =: cId", Student.class);
        query.setParameter("cId", student_id);
        return query.getSingleResult();
    }

    @Override
    public List<Student> getStudentByCompanyId(int company_id) {
        Session session = sessionFactory.getCurrentSession();
        Query<Student> query = session.createQuery("FROM Student s WHERE s.company.id =: cId", Student.class);
        query.setParameter("cId", company_id);
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
}
