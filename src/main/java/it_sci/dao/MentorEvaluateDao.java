package it_sci.dao;

import it_sci.model.*;

import java.util.List;

public interface MentorEvaluateDao {

    List<MentorEvaluate> getAllMentorEvaluates ();
    MentorEvaluate getMentorEvaluateById (long mEvaId);
    void saveMentorEvaluate(MentorEvaluate mentorEvaluate);
    List<MentorEvaluate> getStatusMentorByStudentSemester(String semester);
    List<String> getAllListSemester();
    List<MentorAnswer> getMentorAnswerBySemester();
    MentorEvaluate updateMentorEvaluate (MentorEvaluate mentorEvaluate);
    List<MentorEvaluate> getMentorEvaluateByMentorId (int mentor_id);
    void deleteMentorEvaluate (String mEvaId);

    double getSumScoreMentor(String stu_id);

    void saveMentorAnswer (MentorAnswer mentorAnswer);

    List<Mentor> getMentorEvalJoinStudent();

    List<MentorEvaluate> getListMentorEvaluateBySemester(String semester);


}
