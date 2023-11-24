package com.students.control.StudentSubject;

import java.util.List;
import org.springframework.stereotype.Service;
import jakarta.transaction.Transactional;

@Service
public class StudentSubjectService {
    private final StudentSubjectRepo studentSubjectRepo;

    public StudentSubjectService(StudentSubjectRepo studentSubjectRepo){
        this.studentSubjectRepo = studentSubjectRepo;
    }

    public StudentSubject addStudentSubject(Long studentId, Long subjectId){
        return studentSubjectRepo.save(new StudentSubject(studentId, subjectId));
    }

    @Transactional
    public StudentSubject updateStudentSubject(StudentSubject newStudentSubject){
        StudentSubject studentSubject = studentSubjectRepo.findById(newStudentSubject.getId())
            .orElseThrow(() -> new IllegalStateException("Student_Subject relation doesn't exists"));
        studentSubject.setStudentId(newStudentSubject.getStudentId());
        studentSubject.setSubjectId(newStudentSubject.getSubjectId());
        return studentSubject;
    }

    @Transactional
    public void deleteStudentSubject(Long studentId, Long subjectId){
        studentSubjectRepo.deleteByStudentIdAndSubjectId(studentId, subjectId);
    }

    public List<StudentSubject> findStudentSubjects(){
        return studentSubjectRepo.findAll();
    }
}
