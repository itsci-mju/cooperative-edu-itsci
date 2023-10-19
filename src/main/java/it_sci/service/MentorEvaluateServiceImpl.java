package it_sci.service;

import it_sci.dao.MentorEvaluateDao;
import it_sci.model.Company;
import it_sci.model.Mentor;
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
    public List<MentorEvaluate> getMentorEvaluateByMentorId(int id) {
        return mentorEvaluateDao.getMentorEvaluateByMentorId(id);
    }

    @Override
    public void deleteMentorEvaluate(String mEvaId) {

    }

    @Override
    public double getSumScoreMentor(String stu_id) {
        return mentorEvaluateDao.getSumScoreMentor(stu_id);
    }

//    @Override
//    public List<MentorEvaluate> getMentorEvaluateByCompany(int companyId) {
//        return null;
//    }
}
