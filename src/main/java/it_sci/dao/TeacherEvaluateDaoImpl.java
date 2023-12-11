package it_sci.dao;

import it_sci.model.*;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.Date;
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
        Query<TeacherEvaluate> query = session.createQuery("SELECT te " + "FROM  TeacherEvaluate te JOIN Student s ON s.student_id = te.student.student_id WHERE s.semester =: sem" ,TeacherEvaluate.class);
        query.setParameter("sem", semester);

        return query.getResultList();
    }

    @Override
    public List<TeacherAnswer> getTeacherAnswerBySemester() {
        Session session = sessionFactory.getCurrentSession();
        Query<TeacherAnswer> query = session.createQuery(
                "SELECT ta " +
                        "FROM TeacherAnswer ta " +
                        "JOIN ta.teacherEvaluate te ", TeacherAnswer.class
        );
        return query.getResultList();
    }

    @Override
    public List<TeacherEvaluate> getViewTeacherEvaluate(int teacher_id) {
        Session session = sessionFactory.getCurrentSession();
        Query<TeacherEvaluate> query = session.createQuery("FROM TeacherEvaluate te WHERE te.teacher.teacher_id =: tId", TeacherEvaluate.class);
        query.setParameter("tId", teacher_id);
        return query.getResultList();
    }


    @Override
    public List<String> getAllListSemester() {
        Session session = sessionFactory.getCurrentSession();
        Query<String> query = session.createQuery("SELECT DISTINCT s.semester FROM Student s ORDER BY s.semester DESC", String.class);
        List<String> semesters = query.getResultList();
        for(String s : semesters){
            System.out.println("s.semester DESC " + s);
        }
        return semesters;
    }

    @Override
    public List<MentorAnswer> getMentorAnswerBySemester(String semester) {
        Session session = sessionFactory.getCurrentSession();
        Query<MentorAnswer> query = session.createQuery(
                "SELECT ma " +
                        "FROM MentorAnswer ma " +
                        "JOIN ma.mentorEvaluate me " +
                        "where ma.mentorEvaluate.student.semester =: sem", MentorAnswer.class
        );
        query.setParameter("sem", semester);

        System.out.println(query.getResultList().size());
        return query.getResultList();
    }

    @Override
    public List<TeacherAnswer> getTeacherAnswerBySemester(String semester) {
        Session session = sessionFactory.getCurrentSession();
        Query<TeacherAnswer> query = session.createQuery(
                "SELECT ta " +
                        "FROM TeacherAnswer ta " +
                        "JOIN ta.teacherEvaluate te " +
                        "where ta.teacherEvaluate.student.semester =: sem", TeacherAnswer.class
        );
        query.setParameter("sem", semester);

        System.out.println(query.getResultList().size());
        return query.getResultList();
    }

    @Override
    public List<TeacherEvaluate> getTeacherEvaluate() {
        Session session = sessionFactory.getCurrentSession();
        Query<TeacherEvaluate> query = session.createQuery("FROM TeacherEvaluate t ", TeacherEvaluate.class);
        return query.getResultList();
    }

    @Override
    public List<TeacherEvaluate> getCompanyAssignBySemester(String semester) {
        Session session = sessionFactory.getCurrentSession();
        Query<TeacherEvaluate> query = session.createQuery(
                "SELECT distinct te FROM TeacherEvaluate te " +
                        "join Student s on te.student.student_id = s.student_id " +
                        "join Company c on s.company.company_id = c.company_id " +

//                        "join MentorEvaluate me on s.student_id = me.student.student_id " +
                        "where te.semester =: sem ", TeacherEvaluate.class
        );
        query.setParameter("sem", semester);

        System.out.println(query.getResultList().size());
        return query.getResultList();
    }


    @Override
    public void saveTeacherAnswer(TeacherAnswer teacherAnswer) {
        Session session = sessionFactory.getCurrentSession();
        session.save(teacherAnswer);
    }


    @Override
    public void saveTeacherEvaluate(TeacherEvaluate teacherEvaluate) {
        Session session = sessionFactory.getCurrentSession();
        session.saveOrUpdate(teacherEvaluate);

    }




    @Override
    public TeacherEvaluate updateTeacherEvaluate (TeacherEvaluate teacherEvaluate) {
        Session session = sessionFactory.getCurrentSession();
        session.saveOrUpdate(teacherEvaluate);
        return teacherEvaluate;

    }

    @Override
    public void updateTeacherEvaluateByCompanyId(TeacherEvaluate teacherEvaluate) {
        Session session = sessionFactory.getCurrentSession();
        session.saveOrUpdate(teacherEvaluate);
    }

    @Override
    public TeacherEvaluate getTeacherEvaluateById(long ass_id) {
        Session session = sessionFactory.getCurrentSession();
        Query<TeacherEvaluate> query = session.createQuery("FROM TeacherEvaluate t WHERE t.assessment_id =: tId", TeacherEvaluate.class);
        query.setParameter("tId", ass_id);
        return query.getSingleResult();
    }

    @Override
    public List<TeacherEvaluate> getTeacherStatusBySemester(String semester) {
        Session session = sessionFactory.getCurrentSession();
        Query<TeacherEvaluate> query = session.createQuery(
                "SELECT te " +
                        "FROM  TeacherEvaluate te JOIN Student s ON s.student_id = te.student.student_id " +
                        " WHERE s.semester =: sem", TeacherEvaluate.class
        );
        query.setParameter("sem", semester);

        System.out.println(query.getResultList().size());
        return query.getResultList();
    }

    @Override
    public List<MentorEvaluate> getMentorStatusBySemester(String semester) {
        Session session = sessionFactory.getCurrentSession();
        Query<MentorEvaluate> query = session.createQuery(
                "SELECT me " +
                        "FROM  MentorEvaluate me JOIN Student s ON s.student_id = me.student.student_id " +
                        " WHERE s.semester =: sem", MentorEvaluate.class
        );
        query.setParameter("sem", semester);

        System.out.println(query.getResultList().size());
        return query.getResultList();
    }

    @Override
    public List<TeacherEvaluate> getTeacherStatusBySemester() {
        Session session = sessionFactory.getCurrentSession();
        Query<TeacherEvaluate> query = session.createQuery(
                "SELECT te " +
                        "FROM  TeacherEvaluate te JOIN Student s ON s.student_id = te.student.student_id ", TeacherEvaluate.class
        );
        System.out.println(query.getResultList().size());
        return query.getResultList();
    }

    @Override
    public List<MentorEvaluate> getMentorStatusBySemester() {
        Session session = sessionFactory.getCurrentSession();
        Query<MentorEvaluate> query = session.createQuery(
                "SELECT me " +
                        "FROM  MentorEvaluate me JOIN Student s ON s.student_id = me.student.student_id ", MentorEvaluate.class
        );

        System.out.println(query.getResultList().size());
        return query.getResultList();
    }

    @Override
    public List<TeacherEvaluate> getListTeacherEvaluateBySemester(String semester) {
        Session session = sessionFactory.getCurrentSession();
        Query<TeacherEvaluate> query = session.createQuery(
                "SELECT te " +
                        "FROM  TeacherEvaluate te JOIN Student s ON s.student_id = te.student.student_id " +
                        " WHERE s.semester =: sem ", TeacherEvaluate.class
        );
        query.setParameter("sem", semester);


        System.out.println(query.getResultList().size());
        return query.getResultList();
    }



    @Override
    public List<Teacher> getAssignTeacher(int company_id, String semester, Date teacher_super_vision_date, String teacher_super_vision_time) {
        Session session = sessionFactory.getCurrentSession();
        Query<Object[]> query = session.createQuery(
                "select teacher_id, teacher_name, teacher_lastname from Teacher where status = 'อยู่' and teacher_id not in " +
                        "(SELECT teacher.teacher_id FROM TeacherEvaluate " +
                        "where teacher_super_vision_date =: tEvaDate and teacher_super_vision_time =: tEvaTime " +
                        "group by teacher.teacher_id)", Object[].class);
//        query.setParameter("cId", company_id);
//        query.setParameter("sem", semester);
        query.setParameter("tEvaDate", teacher_super_vision_date);
        query.setParameter("tEvaTime", teacher_super_vision_time);

        List<Teacher> teachers = new ArrayList<>();

        List<Object[]> results = query.getResultList();
        for (Object[] result : results) {
            Teacher t = new Teacher();
            t.setTeacher_id((int) result[0]);
            t.setTeacher_name(result[1].toString());
            t.setTeacher_lastname(result[2].toString());
            //Student s = (Student) result[1];
            //Company c = (Company) result[2];

            // ทำตามความเหมาะสมเพื่อกำหนดค่าให้กับ TeacherEvaluate ด้วยข้อมูลจากผลลัพธ์
            // ตัวอย่าง: te.setStudent(s);, te.setCompany(c);

            System.out.println("teacher " + teachers);
            teachers.add(t);
        }

//        System.out.println(teacherEvaluates.size());
        return teachers;
    }

    @Override
    public Teacher getUpdateAssignTeacher(int company_id, String semester, Date teacher_super_vision_date, String teacher_super_vision_time) {
        Session session = sessionFactory.getCurrentSession();
        Query<Object[]> query = session.createQuery(
                "select teacher_id, teacher_name, teacher_lastname from Teacher where status = 'อยู่' and teacher_id in " +
                        "(SELECT teacher.teacher_id FROM TeacherEvaluate " +
                        "where teacher_super_vision_date =: tEvaDate and teacher_super_vision_time =: tEvaTime " +
                        "group by teacher.teacher_id)", Object[].class);
//        query.setParameter("cId", company_id);
//        query.setParameter("sem", semester);
        query.setParameter("tEvaDate", teacher_super_vision_date);
        query.setParameter("tEvaTime", teacher_super_vision_time);

        List<Teacher> teachers = new ArrayList<>();

        List<Object[]> results = query.getResultList();
        for (Object[] result : results) {
            Teacher t = new Teacher();
            t.setTeacher_id((int) result[0]);
            t.setTeacher_name(result[1].toString());
            t.setTeacher_lastname(result[2].toString());
            //Student s = (Student) result[1];
            //Company c = (Company) result[2];

            // ทำตามความเหมาะสมเพื่อกำหนดค่าให้กับ TeacherEvaluate ด้วยข้อมูลจากผลลัพธ์
            // ตัวอย่าง: te.setStudent(s);, te.setCompany(c);

            System.out.println("teacher " + teachers);
            teachers.add(t);
        }

//        System.out.println(teacherEvaluates.size());
        return teachers.get(0);
    }

    @Override
    public List<Teacher> getTeacherByStatusOn() {
        Session session = sessionFactory.getCurrentSession();
        Query<Teacher> query = session.createQuery(
                    "FROM Teacher t where t.status =: statusOn ", Teacher.class );


        query.setParameter("statusOn", "อยู่");
        System.out.println(query.getResultList().size());
        return query.getResultList();
    }

    @Override
    public List<TeacherEvaluate> getSubmitAssignTeacher(int company_id, String semester) {
        Session session = sessionFactory.getCurrentSession();
        Query<TeacherEvaluate> query = session.createQuery(
                "FROM TeacherEvaluate te where te.student.company.company_id =: cId and te.semester =: sem ", TeacherEvaluate.class );

        query.setParameter("cId", company_id);
        query.setParameter("sem", semester);
        return query.getResultList();
    }

    @Override
    public List<TeacherEvaluate> getCheckAssignTeacher() {
        Session session = sessionFactory.getCurrentSession();
        Query<TeacherEvaluate> query = session.createQuery(
                "FROM TeacherEvaluate te ", TeacherEvaluate.class );

        return query.getResultList();
    }

}
