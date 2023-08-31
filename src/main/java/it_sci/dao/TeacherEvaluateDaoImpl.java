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

}
