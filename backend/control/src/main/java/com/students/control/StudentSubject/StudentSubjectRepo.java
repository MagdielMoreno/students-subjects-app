package com.students.control.StudentSubject;

import org.springframework.data.jpa.repository.JpaRepository;

public interface StudentSubjectRepo extends JpaRepository<StudentSubject, Long>{
    void deleteStudentSubjectById(Long id);
    StudentSubject findStudentSubjectById(Long id);
    void deleteByStudentIdAndSubjectId(Long studentId, Long subjectId);
}
