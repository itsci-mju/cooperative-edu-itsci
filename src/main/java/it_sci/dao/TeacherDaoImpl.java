package it_sci.dao;


import it_sci.model.*;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public class TeacherDaoImpl implements TeacherDao{

    @Autowired
    private SessionFactory sessionFactory;
    @Override
    public Teacher getTeacherById(int teacher_id) {
        Session session = sessionFactory.getCurrentSession();
        Query<Teacher> query = session.createQuery("FROM Teacher t WHERE t.teacher_id =: tId", Teacher.class);
        query.setParameter("tId", teacher_id);
        return query.getSingleResult();
    }

    @Override
    public Teacher getteacherProfile(int id) {
        Session session = sessionFactory.getCurrentSession();
        Teacher teacher = session.get(Teacher.class, id);
        return teacher;
    }

    @Override
    public Student getStudent(String student_id) {
        Session session = sessionFactory.getCurrentSession();
        Student student = session.get(Student.class, student_id);
        return student;
    }

    @Override
    public List<Mentor> getMentorsByStudentId(String studentId) {
        Session session = sessionFactory.getCurrentSession();
        Query<Mentor> query = session.createQuery("SELECT m FROM Mentor m INNER JOIN m.students s WHERE s.student_id =:stuid", Mentor.class);
        query.setParameter("stuid",studentId);
        return query.getResultList();
    }

    @Override
    public List<Teacher> getAllTeachers() {
        Session session = sessionFactory.getCurrentSession();
        Query<Teacher> query = session.createQuery("FROM Teacher", Teacher.class);
        List<Teacher> teachers = query.getResultList();
        return teachers;
    }

    @Override
    public List<Student> getSemester(String semester) {
        Session session = sessionFactory.getCurrentSession();
        Query<Student> query = session.createQuery("FROM Student s WHERE s.semester =: sem", Student.class);
        query.setParameter("sem", semester);
        return query.getResultList();
    }

//    @Override
//    public List<String> getStudentSemester(String semester) {
//        Session session = sessionFactory.getCurrentSession();
//        Query<Teacher> query = session.createQuery("SELECT * FROM student WHERE semester = 'ภาคเรียนที่2/2565' ");
//        return semester;
//    }

    @Override
    public void saveTeacherEvaluate(TeacherEvaluate teacherEvaluate) {
        Session session = sessionFactory.getCurrentSession();
        session.save(teacherEvaluate);
    }

    @Override
    public List<Company> getCompanyToAssignByTeacher(int teacher_id) {
        Session session = sessionFactory.getCurrentSession();

        Query<Company> query = session.createQuery(
                "SELECT c " +
                        "FROM  Company c " +
                        "JOIN Student s ON c.company_id = s.company.company_id " +
                        "JOIN TeacherEvaluate te ON s.student_id = te.student.student_id "+
                        "WHERE te.teacher.id = :teacherId " +
                        "GROUP BY te.student.company.company_id", Company.class
        );
        query.setParameter("teacherId", teacher_id);
//        System.out.println("result : " + query.getResultList().size());
//        System.out.println("teacherId : " + teacher_id);
        return query.getResultList();
    }

    @Override
    public List<Company> getListCompanySupervision(String semester,int teacher_id) {
        Session session = sessionFactory.getCurrentSession();

        Query<Company> query = session.createQuery(
                "SELECT c " +
                        "FROM  Company c " +
                        "JOIN Student s ON c.company_id = s.company.company_id " +
                        "JOIN TeacherEvaluate te ON s.student_id = te.student.student_id "+
                        "WHERE te.student.semester =: sem and te.teacher.id = :teacherId " +
                        "GROUP BY te.student.company.company_id", Company.class
        );
        query.setParameter("sem", semester);
        query.setParameter("teacherId", teacher_id);
        return query.getResultList();
    }

    @Override
    public List<Company> getListCompanySupervision(int teacher_id) {
        Session session = sessionFactory.getCurrentSession();

        Query<Company> query = session.createQuery(
                "SELECT c " +
                        "FROM  Company c " +
                        "JOIN Student s ON c.company_id = s.company.company_id " +
                        "JOIN TeacherEvaluate te ON s.student_id = te.student.student_id "+
                        "WHERE te.teacher.id = :teacherId " +
                        "GROUP BY te.student.company.company_id", Company.class
        );
        query.setParameter("teacherId", teacher_id);
        return query.getResultList();
    }
}
