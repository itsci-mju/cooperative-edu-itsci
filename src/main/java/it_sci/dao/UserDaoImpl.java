package it_sci.dao;

import it_sci.model.Mentor;
import it_sci.model.Teacher;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class UserDaoImpl implements UserDao {

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public Mentor getMentorByUsername(String email) {
        Session session = sessionFactory.getCurrentSession();
        Query<Mentor> query = session.createQuery("FROM Mentor m WHERE m.mentor_email =: m_email", Mentor.class);
        query.setParameter("m_email",email);
        Mentor mentor = new Mentor();
        try {
            mentor = query.getSingleResult();
        }catch (Exception e){

        }
        return mentor;
    }

    @Override
    public Teacher getTeacherByUsername(String email) {
        Session session = sessionFactory.getCurrentSession();
        Query<Teacher> query = session.createQuery("FROM Teacher t WHERE t.teacher_email =: t_email", Teacher.class);
        query.setParameter("t_email",email);
        Teacher teacher = new Teacher();
        try {
            teacher = query.getSingleResult();
        }catch (Exception e){

        }
        return teacher;
    }
}
