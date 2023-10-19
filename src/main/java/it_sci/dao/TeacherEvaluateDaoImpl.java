package it_sci.dao;

import it_sci.model.*;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import java.util.List;

@Repository
public class TeacherEvaluateDaoImpl implements TeacherEvaluateDao {

    @Autowired
    private SessionFactory sessionFactory;



    @Override
    public List<TeacherEvaluate> getTeacherEvaluateByTeacherId (int tEvaId,int companyId,String semester){
        Session session = sessionFactory.getCurrentSession();
        Query<TeacherEvaluate> query = session.createQuery(
                "SELECT te " +
                        "FROM  TeacherEvaluate te " +
                        "JOIN Student s ON te.student.student_id = s.student_id " +
                        "JOIN Company c ON s.company.company_id = c.company_id "+
                        "WHERE te.teacher.id = :teacherId and te.student.company.company_id =: companyId and s.semester = :sem ", TeacherEvaluate.class
        );
        query.setParameter("teacherId", tEvaId);
        query.setParameter("companyId", companyId);
        query.setParameter("sem", semester);

        System.out.println(query.getResultList().size());
        return query.getResultList();
    }

    @Override
    public List<TeacherEvaluate> getViewTeacherEvaluateByStudentSemester(String semester, int teacher_id) {
        Session session = sessionFactory.getCurrentSession();
        Query<TeacherEvaluate> query = session.createQuery(
                "SELECT te " +
                        "FROM TeacherEvaluate te " +
                        "JOIN te.student s " +
                        "WHERE te.teacher.teacher_id = :teacherId " +
                        "AND s.semester = :sem ",
                TeacherEvaluate.class
        );

        query.setParameter("teacherId", teacher_id);
        query.setParameter("sem", semester);

        return query.getResultList();
    }


    @Override
    public List<TeacherEvaluate> getStatusByStudentSemester(String semester) {
        Session session = sessionFactory.getCurrentSession();
        //        Query<TeacherEvaluate> query = session.createQuery(
//                "SELECT te " +
//                        "FROM  TeacherEvaluate te " +
//                        "JOIN Student s ON te.student.student_id = s.student_id " +
//                        "JOIN MentorEvaluate me ON s.mentorEvaluateList = c.company_id "+
//                        "WHERE s.semester = :sem ",
//                TeacherEvaluate.class
//        );
        Query<TeacherEvaluate> query = session.createQuery("SELECT te " + "FROM  TeacherEvaluate te JOIN Student s ON s.student_id = te.student.student_id WHERE s.semester =: sem" ,TeacherEvaluate.class);
        query.setParameter("sem", semester);

        return query.getResultList();
    }



//    public List<TeacherEvaluate> getViewTeacherEvaluateByStudentSemester(String semester, int teacher_id) {
//        Session session = sessionFactory.getCurrentSession();
//        Query<TeacherEvaluate> query = session.createQuery("FROM TeacherEvaluate te " +
//                "JOIN Student s ON  s.student_id = te.student.student_id " +
//               " WHERE te.teacher.teacher_id =: teacherId AND s.semester =: sem ", TeacherEvaluate.class);
//
//        query.setParameter("sem", semester);
//        query.setParameter("teacherId", teacher_id);
//        List<TeacherEvaluate> teacherEvaluates =  query.getResultList();
//        System.out.println(teacherEvaluates.size());
//        return teacherEvaluates;
//    }

    @Override
    public List<TeacherEvaluate> getViewTeacherEvaluate(int teacher_id) {
        Session session = sessionFactory.getCurrentSession();
        Query<TeacherEvaluate> query = session.createQuery("FROM TeacherEvaluate te WHERE te.teacher.teacher_id =: tId", TeacherEvaluate.class);
        query.setParameter("tId", teacher_id);
        return query.getResultList();
    }
//    @Override
//    public List<TeacherEvaluate> getTeacherEvaluateByTeacherId (int tEvaId,int companyId,String semester){
//        Session session = sessionFactory.getCurrentSession();
//        Query<TeacherEvaluate> query = session.createQuery(
//                "SELECT te " +
//                        "FROM  TeacherEvaluate te " +
//                        "JOIN Student s ON te.student.student_id = s.student_id " +
//                        "JOIN Company c ON s.company.company_id = c.company_id "+
//                        "WHERE te.teacher.id = :teacherId and te.student.company.company_id =: companyId and s.semester = :sem", TeacherEvaluate.class
//        );
//        query.setParameter("teacherId", tEvaId);
//        query.setParameter("companyId", companyId);
//        query.setParameter("sem", semester);
//
//        System.out.println(query.getResultList().size());
//        return query.getResultList();
//    }


    @Override
    public List<String> getAllListSemester() {
        Session session = sessionFactory.getCurrentSession();
        Query<String> query = session.createQuery("SELECT DISTINCT s.semester FROM Student s ORDER BY s.semester DESC", String.class);
        List<String> semesters = query.getResultList();
//        System.out.println("---------------------------------------------"+semesters);
        return semesters;
    }

//    @Override
//    public List<String> getAllListSemester() {
//        Session session = sessionFactory.getCurrentSession();
//        CriteriaBuilder builder = session.getCriteriaBuilder();
//        CriteriaQuery<String> criteriaQuery = builder.createQuery(String.class);
//        Root<Student> root = criteriaQuery.from(Student.class);
//
//        criteriaQuery.select(root.get("semester")).distinct(true).orderBy(builder.desc(root.get("semester")));
//
//        List<String> semesters = session.createQuery(criteriaQuery).getResultList();
//
//        // รีเทิร์นรายการภาคการศึกษาที่ได้มา
//        return semesters;
//    }



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
