package it_sci.dao;

import it_sci.model.Company;
import it_sci.model.Mentor;
import it_sci.model.Student;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Objects;

@Repository
public class MentorDaoImpl implements MentorDao {

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public Mentor getMentorById(int mentor_id) {
        Session session = sessionFactory.getCurrentSession();
        Query<Mentor> query = session.createQuery("FROM Mentor m WHERE m.mentor_id =: mId", Mentor.class);
        query.setParameter("mId", mentor_id);
//        System.out.println(query.getSingleResult());
//        System.out.println(mentor_id);
//        System.out.println(query.getSingleResult().getStudents().size());
        return query.getSingleResult();
    }

    @Override
    public List<Mentor> getMentorByIdAndStuId(int mentor_id,String term) {
        Session session = sessionFactory.getCurrentSession();
        Query<Mentor> query = session.createQuery("SELECT m FROM Mentor m INNER JOIN m.students s "+
                    "WHERE m.mentor_id =: mId and s.semester =: term", Mentor.class);
        query.setParameter("mId", mentor_id);
        query.setParameter("term", term);
//        System.out.println(query.getSingleResult());
//        System.out.println(mentor_id);
//        System.out.println(query.getSingleResult().getStudents().size());
        return query.getResultList();
    }

    @Override
    public List<Mentor> getListStudentByMenterId(int mentor_id) {
        Session session = sessionFactory.getCurrentSession();
        Query<Mentor> query = session.createQuery("from Mentor where mentor_id =: mId",Mentor.class);
        query.setParameter("mId",mentor_id);
        return query.getResultList();
    }

    @Override
    public Mentor updateMentor(Mentor mentor) {
        Session session = sessionFactory.getCurrentSession();
        session.saveOrUpdate(mentor);
        return mentor;
    }
    @Override
    public Mentor getMentorProfile(int id) {
        Session session = sessionFactory.getCurrentSession();
        Mentor mentor = session.get(Mentor.class, id);
        return mentor;
    }

    @Override
    public List<Mentor> getManageLoginMentor(String semester) {
        Session session = sessionFactory.getCurrentSession();

        String hql = "SELECT DISTINCT m " +
                "FROM Mentor m " +
                "JOIN m.students s " +
                "JOIN s.company c " +
                "WHERE s.semester = :sem";

        Query<Mentor> query = session.createQuery(hql, Mentor.class);
        query.setParameter("sem", semester);

        return query.getResultList();
    }



//        String hql = "SELECT DISTINCT m " +
//                "FROM Mentor m " +
//                "join MentorEvaluate me on m.mentor_id = me.mentor.mentor_id " +
//                "join me.student s " +
//                "join s.company c " +
//                "where s.semester = :sem";

        //        Query<Mentor> query = session.createQuery( "SELECT DISTINCT m " +
//                        "FROM Mentor m " +
//                        "JOIN " +
//                        "JOIN mentor_student ms ON m.mentor_id = ms.mentor_mentorid " +
//                        "JOIN Student s ON ms.student_studentid = s.student_id " +
//                        "JOIN Company c ON s.company.company_id = c.company_id " +
//                        " WHERE s.semester = :sem " +
//         "AS filtered_mentors ON m.mentorid = filtered_mentors.mentorid",Mentor.class);



    @Override
    public List<Mentor> getMentorPasswordNotNull() {
        Session session = sessionFactory.getCurrentSession();
        Query<Mentor> query = session.createQuery("FROM Mentor m where m.password != '' ", Mentor.class);
        return query.getResultList();
    }

    @Override
    public void updateMentorPassword(Mentor mentor) {
        Session session = sessionFactory.getCurrentSession();
        session.saveOrUpdate(mentor);
    }

}
