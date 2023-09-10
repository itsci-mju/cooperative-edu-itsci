package it_sci.dao;

import it_sci.model.Company;
import it_sci.model.Mentor;
import it_sci.model.MentorEvaluate;
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
    public MentorEvaluate getMentorEvaluateById(String mEvaId) {
        return null;
    }

    @Override
    public void saveMentorEvaluate(MentorEvaluate mentorEvaluate) {
        Session session = sessionFactory.getCurrentSession();
        session.save(mentorEvaluate);
    }

    @Override
    public List<MentorEvaluate> getMentorEvaluateByMentorId (int mEvaId){
        Session session = sessionFactory.getCurrentSession();
        Query<MentorEvaluate> query = session.createQuery("FROM MentorEvaluate me WHERE me.mentor.id =: mId", MentorEvaluate.class);
        query.setParameter("mId", mEvaId);
//        System.out.println(query.getSingleResult());
//        System.out.println(mentor_id);
//        System.out.println(query.getSingleResult().getStudents().size());
        return query.getResultList();
    }
    @Override
    public MentorEvaluate updateMentorEvaluate(MentorEvaluate mentorEvaluate) {
            Session session = sessionFactory.getCurrentSession();
            session.saveOrUpdate(mentorEvaluate);
            return mentorEvaluate;

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
    public void deleteMentorEvaluate(String mEvaId) {

    }
}
