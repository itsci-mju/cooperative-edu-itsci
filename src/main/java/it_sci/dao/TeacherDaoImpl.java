package it_sci.dao;


import it_sci.model.Company;
import it_sci.model.MentorEvaluate;
import it_sci.model.Teacher;
import it_sci.model.TeacherEvaluate;
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
    public List<Teacher> getAllTeachers() {
        Session session = sessionFactory.getCurrentSession();
        Query<Teacher> query = session.createQuery("FROM Teacher", Teacher.class);
        List<Teacher> teachers = query.getResultList();
        return teachers;
    }
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
}
