package com.students.control.Subject;

import java.util.List;

import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import jakarta.transaction.Transactional;

@Service
public class SubjectService {
    private final SubjectRepo subjectRepo;

    public SubjectService(SubjectRepo subjectRepo){
        this.subjectRepo = subjectRepo;
    }

    public Subject addSubject(Subject subject){
        return subjectRepo.save(subject);
    }

    @Transactional
    public Subject updateSubject(Subject newSubject){
        Subject subject = subjectRepo.findById(newSubject.getId())
            .orElseThrow(() -> new IllegalStateException("Subject doesn't exists"));
        subject.setName(newSubject.getName());
        return subject;
    }

    public void deleteSubject(Long id){
        if(!subjectRepo.existsById(id))
            throw new IllegalStateException("Subject doesn't exists");
        subjectRepo.deleteById(id);
    }

    public Subject findSubject(Long id){
        return subjectRepo.findSubjectById(id);
    }

    public List<Subject> findAllSubjects(){
        return subjectRepo.findAll(Sort.by(Sort.Direction.DESC, "id"));
    }
}
