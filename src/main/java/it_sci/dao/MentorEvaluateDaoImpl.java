package it_sci.dao;

import it_sci.model.*;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class MentorEvaluateDaoImpl implements MentorEvaluateDao {

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public List<MentorEvaluate> getAllMentorEvaluates() {
        Session session = sessionFactory.getCurrentSession();
        Query<MentorEvaluate> query = session.createQuery("FROM MentorEvaluate", MentorEvaluate.class);
        List<MentorEvaluate> mentorEvaluates = query.getResultList();
        return mentorEvaluates;
    }

    @Override
    public MentorEvaluate getMentorEvaluateById(long mEvaId) {
        Session session = sessionFactory.getCurrentSession();
        Query<MentorEvaluate> query = session.createQuery("FROM MentorEvaluate WHERE assessment_id =: aId", MentorEvaluate.class);
        query.setParameter("aId", mEvaId);
        return query.getSingleResult();
    }

    @Override
    public void saveMentorEvaluate(MentorEvaluate mentorEvaluate) {
        Session session = sessionFactory.getCurrentSession();
        session.save(mentorEvaluate);
    }

    @Override
    public List<MentorEvaluate> getStatusMentorByStudentSemester(String semester) {
        Session session = sessionFactory.getCurrentSession();
        Query<MentorEvaluate> query = session.createQuery("SELECT me " + "FROM  MentorEvaluate me JOIN Student s ON s.student_id = me.student.student_id WHERE s.semester =: sem" ,MentorEvaluate.class);
        query.setParameter("sem", semester);

        return query.getResultList();
    }

    @Override
    public List<MentorEvaluate> getMentorEvaluateByMentorId (int mentor_id){
        Session session = sessionFactory.getCurrentSession();
        Query<MentorEvaluate> query = session.createQuery("FROM MentorEvaluate me WHERE me.mentor.mentor_id =: mId", MentorEvaluate.class);
        query.setParameter("mId", mentor_id);
        return query.getResultList();
    }

    @Override
    public MentorEvaluate updateMentorEvaluate(MentorEvaluate mentorEvaluate) {
            Session session = sessionFactory.getCurrentSession();
            session.saveOrUpdate(mentorEvaluate);
            return mentorEvaluate;

    }

    @Override
    public List<String> getAllListSemester() {
        Session session = sessionFactory.getCurrentSession();
        Query<String> query = session.createQuery("SELECT DISTINCT s.semester FROM Student s ORDER BY s.semester DESC", String.class);
        return query.getResultList();
    }

    @Override
    public List<MentorAnswer> getMentorAnswerBySemester() {
        Session session = sessionFactory.getCurrentSession();
        Query<MentorAnswer> query = session.createQuery(
                "SELECT ma " +
                        "FROM MentorAnswer ma " +
                        "JOIN ma.mentorEvaluate me ", MentorAnswer.class
        );
        return query.getResultList();
    }

    @Override
    public double getSumScoreMentor(String stu_id) {
        Session session = sessionFactory.getCurrentSession();
        Query<MentorEvaluate> query = session.createQuery("FROM MentorEvaluate m " +
                "where m.student.student_id=:stuid ", MentorEvaluate.class);
        query.setParameter("stuid", stu_id);

        double sum = 0.0;
        for(MentorEvaluate mentorEvaluate : query.getResultList()){
            sum = sum + mentorEvaluate.getScore();
        }
        sum = sum / query.getResultList().size();
        return sum;
    }

    @Override
    public void saveMentorAnswer(MentorAnswer mentorAnswer) {
        Session session = sessionFactory.getCurrentSession();
        session.save(mentorAnswer);
    }

    @Override
    public List<Mentor> getMentorEvalJoinStudent() {
        Session session = sessionFactory.getCurrentSession();
        Query<Mentor> query = session.createQuery(
                "SELECT m " +
                        "FROM Mentor m " +
                        "JOIN MentorEvaluate me on m.mentor_id = me.mentor.mentor_id " +
                        "JOIN Student s on me.student.student_id = s.student_id", Mentor.class);
        return query.getResultList();
    }

    @Override
    public List<MentorEvaluate> getListMentorEvaluateBySemester(String semester) {
            Session session = sessionFactory.getCurrentSession();
            Query<MentorEvaluate> query = session.createQuery(
                    "SELECT me " +
                            "FROM  MentorEvaluate me JOIN Student s on s.student_id = me.student.student_id " +
                            " WHERE s.semester =: sem", MentorEvaluate.class
            );
            query.setParameter("sem", semester);
            System.out.println(query.getResultList().size());
            return query.getResultList();
        }


    @Override
    public void deleteMentorEvaluate(String mEvaId) {

    }
}
