package it_sci.service;

import it_sci.model.Company;
import it_sci.model.Mentor;
import it_sci.model.MentorAnswer;
import it_sci.model.MentorEvaluate;

import java.util.List;

public interface MentorEvaluateService {

    List<MentorEvaluate> getAllMentorEvaluates ();
    MentorEvaluate getMentorEvaluateById (long mEvaId);
    void saveMentorEvaluate(MentorEvaluate mentorEvaluate);
    List<MentorEvaluate> getStatusMentorByStudentSemester(String semester);
    List<MentorAnswer> getMentorAnswerBySemester();
    List<String> getAllListSemester() ;
    MentorEvaluate updateMentorEvaluate (MentorEvaluate mentorEvaluate);
    List<MentorEvaluate> getMentorEvaluateByMentorId (int mentor_id);
    void deleteMentorEvaluate (String mEvaId);

    double getSumScoreMentor(String stu_id);

    void saveMentorAnswer (MentorAnswer mentorAnswer);

//    List<MentorEvaluate> getMentorEvaluateByCompany(int companyId);

    List<Mentor> getMentorEvalJoinStudent();

    List<MentorEvaluate> getListMentorEvaluateBySemester(String semester);
}
