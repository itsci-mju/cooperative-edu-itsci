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
//    @Override
//    public List<Company> getCompanyToAssignByTeacher(int teacher_id) {
//        Session session = sessionFactory.getCurrentSession();
//
//        Query<Company> query = session.createQuery(
//                "SELECT c " +
//                        "FROM  Company c " +
//                        "JOIN Student s ON c.company_id = s.company.company_id " +
//                        "JOIN TeacherEvaluate te ON s.student_id = te.student.student_id "+
//                        "WHERE te.teacher.id = :teacherId " +
//                        "GROUP BY te.student.company.company_id", Company.class
//        );
//        query.setParameter("teacherId", teacher_id);
////        System.out.println("result : " + query.getResultList().size());
////        System.out.println("teacherId : " + teacher_id);
//        return query.getResultList();
//    }

    @Override
    public List<Mentor> getMentorByIdAndStuId(int mentor_id) {
        Session session = sessionFactory.getCurrentSession();
        Query<Mentor> query = session.createQuery("SELECT m FROM Mentor m INNER JOIN m.students s "+
                " inner join s.mentorEvaluateList "+
                "WHERE m.mentor_id =: mId", Mentor.class);
        query.setParameter("mId", mentor_id);
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

//    @Override
//    public List<Student> getMentorDoesNotHaveStudent(int id) {
//        Session session = sessionFactory.getCurrentSession();
//        Query<Student> query = session.createQuery("select s.students from Mentor s where s.mentor_id=:id");
//        query.setParameter("id",id);
//        List<Student> stuList1 = query.getResultList();
//        query = session.createQuery("from Student");
//        List<Student> stuList2 = query.getResultList();
//        stuList2.removeAll(stuList1);
//        return stuList2;
//    }
}
