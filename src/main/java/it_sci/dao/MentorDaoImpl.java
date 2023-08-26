package it_sci.dao;

import it_sci.model.Mentor;
import it_sci.model.Student;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

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
    public List<Student> getMentorDoesNotHaveStudent(int id) {
        Session session = sessionFactory.getCurrentSession();
        Query<Student> query = session.createQuery("select s.students from Mentor s where s.mentor_id=:id");
        query.setParameter("id",id);
        List<Student> stuList1 = query.getResultList();
        query = session.createQuery("from Student");
        List<Student> stuList2 = query.getResultList();
        stuList2.removeAll(stuList1);
        return stuList2;
    }
}
