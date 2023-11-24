package com.students.control.Subject;

import org.springframework.data.jpa.repository.JpaRepository;

public interface SubjectRepo extends JpaRepository<Subject, Long>{
    void deleteSubjectById(Long id);
    Subject findSubjectById(Long id);
}
