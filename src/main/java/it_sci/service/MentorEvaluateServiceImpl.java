package it_sci.service;

import it_sci.dao.MentorEvaluateDao;
import it_sci.model.Company;
import it_sci.model.Mentor;
import it_sci.model.MentorAnswer;
import it_sci.model.MentorEvaluate;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class MentorEvaluateServiceImpl implements MentorEvaluateService {

    @Autowired
    private MentorEvaluateDao mentorEvaluateDao;

    @Override
    @Transactional
    public List<MentorEvaluate> getAllMentorEvaluates() {
        return mentorEvaluateDao.getAllMentorEvaluates();
    }

    @Override
    @Transactional
    public MentorEvaluate getMentorEvaluateById(long mEvaId) {
        return mentorEvaluateDao.getMentorEvaluateById(mEvaId);
    }

    @Override
    @Transactional
    public void saveMentorEvaluate(MentorEvaluate mentorEvaluate) {
        mentorEvaluateDao.saveMentorEvaluate(mentorEvaluate);
    }

    @Override
    @Transactional
    public List<MentorEvaluate> getStatusMentorByStudentSemester(String semester) {
        return mentorEvaluateDao.getStatusMentorByStudentSemester(semester);
    }

    @Override
    @Transactional
    public List<MentorAnswer> getMentorAnswerBySemester() {
        return mentorEvaluateDao.getMentorAnswerBySemester();
    }

    @Override
    @Transactional
    public List<String> getAllListSemester()  {
        return mentorEvaluateDao.getAllListSemester();

    }

    @Override
    @Transactional
    public MentorEvaluate updateMentorEvaluate(MentorEvaluate mentorEvaluate) {
        mentorEvaluateDao.updateMentorEvaluate(mentorEvaluate);
        return mentorEvaluate;
    }

    @Override
    @Transactional
    public List<MentorEvaluate> getMentorEvaluateByMentorId(int mentor_id) {
        return mentorEvaluateDao.getMentorEvaluateByMentorId(mentor_id);
    }

    @Override
    @Transactional
    public void deleteMentorEvaluate(String mEvaId) {

    }

    @Override
    @Transactional
    public double getSumScoreMentor(String stu_id) {
        return mentorEvaluateDao.getSumScoreMentor(stu_id);
    }

    @Override
    @Transactional
    public void saveMentorAnswer(MentorAnswer mentorAnswer) {
       mentorEvaluateDao.saveMentorAnswer(mentorAnswer);
    }

    @Override
    @Transactional
    public List<Mentor> getMentorEvalJoinStudent() {
        return mentorEvaluateDao.getMentorEvalJoinStudent();
    }

    @Override
    @Transactional
    public List<MentorEvaluate> getListMentorEvaluateBySemester(String semester) {
        return mentorEvaluateDao.getListMentorEvaluateBySemester(semester);
    }


}
