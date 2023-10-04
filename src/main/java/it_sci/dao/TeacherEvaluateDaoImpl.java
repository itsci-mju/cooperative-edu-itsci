package it_sci.dao;

import it_sci.model.*;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
public class TeacherEvaluateDaoImpl implements TeacherEvaluateDao {

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public List<TeacherEvaluate> getTeacherEvaluateByTeacherId (int tEvaId,int companyId){
        Session session = sessionFactory.getCurrentSession();
        Query<TeacherEvaluate> query = session.createQuery(
                "SELECT te " +
                        "FROM  TeacherEvaluate te " +
                        "JOIN Student s ON te.student.student_id = s.student_id " +
                        "JOIN Company c ON s.company.company_id = c.company_id "+
                        "WHERE te.teacher.id = :teacherId and te.student.company.company_id =: companyId ", TeacherEvaluate.class
        );
        query.setParameter("teacherId", tEvaId);
        query.setParameter("companyId", companyId);
//        System.out.println(query.getSingleResult());
//        System.out.println(mentor_id);
//        System.out.println(query.getSingleResult().getStudents().size());
        System.out.println(query.getResultList().size());
        return query.getResultList();
    }

//    @Override
//    public List<Student> getAllListSemester() {
//        Session session = sessionFactory.getCurrentSession();
//        Query<Student> query = session.createQuery("SELECT semester FROM Student GROUP BY semester ORDER BY semester DESC", Student.class);
//        return query.getResultList();
//    }

    @Override
    public List<String> getAllListSemester() {
        Session session = sessionFactory.getCurrentSession();
        Query<String> query = session.createQuery("SELECT DISTINCT s.semester FROM Student s ORDER BY s.semester DESC", String.class);
        List<String> semesters = query.getResultList();
        System.out.println("---------------------------------------------"+semesters);
        return semesters;
    }






    @Override
    public List<TeacherEvaluate> getViewTeacherEvaluate(int teacher_id) {
        Session session = sessionFactory.getCurrentSession();
        Query<TeacherEvaluate> query = session.createQuery("FROM TeacherEvaluate te WHERE te.teacher.teacher_id =: tId", TeacherEvaluate.class);
        query.setParameter("tId", teacher_id);
        return query.getResultList();
    }

    @Override
    public List<TeacherEvaluate> getTeacherEvaluate() {
        Session session = sessionFactory.getCurrentSession();
        Query<TeacherEvaluate> query = session.createQuery("FROM TeacherEvaluate t ", TeacherEvaluate.class);
        return query.getResultList();
    }



    @Override
    public void saveTeacherAnswer(TeacherAnswer teacherAnswer) {
        Session session = sessionFactory.getCurrentSession();
        session.save(teacherAnswer);
    }


    @Override
    public void saveTeacherEvaluate(TeacherEvaluate teacherEvaluate){
        Session session = sessionFactory.getCurrentSession();
        session.save(teacherEvaluate);
    }

    @Override
    public TeacherEvaluate updateTeacherEvaluate (TeacherEvaluate teacherEvaluate) {
        Session session = sessionFactory.getCurrentSession();
        session.saveOrUpdate(teacherEvaluate);
        return teacherEvaluate;

    }

    @Override
    public TeacherEvaluate getTeacherEvaluateById(long ass_id) {
        Session session = sessionFactory.getCurrentSession();
        Query<TeacherEvaluate> query = session.createQuery("FROM TeacherEvaluate t WHERE t.assessment_id =: tId", TeacherEvaluate.class);
        query.setParameter("tId", ass_id);
        return query.getSingleResult();
    }

//    @Override
//    public List<TeacherEvaluate> getTeacherEvaluateByCompany(int companyId) {
//        return null;
//    }

}
