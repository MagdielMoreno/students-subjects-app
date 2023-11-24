package com.students.control.Student;

import java.util.List;

import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import jakarta.transaction.Transactional;

@Service
public class StudentService {
    private final StudentRepo studentRepo;

    public StudentService(StudentRepo studentRepo){
        this.studentRepo = studentRepo;
    }

    public Student addStudent(Student student){
        return studentRepo.save(student);
    }

    @Transactional
    public Student updateStudent(Student newStudent){
        Student student = studentRepo.findById(newStudent.getId())
            .orElseThrow(() -> new IllegalStateException("Student doesn't exists"));
        student.setName(newStudent.getName());
        student.setEmail(newStudent.getEmail());
        student.setPhone(newStudent.getPhone());
        return student;
    }

    public void deleteStudent(Long id){
        if(!studentRepo.existsById(id))
            throw new IllegalStateException("Student doesn't exists");
        studentRepo.deleteById(id);
    }

    public Student findStudent(Long id){
        return studentRepo.findStudentById(id);
    }

    public List<Student> findAllStudents(){
        return studentRepo.findAll(Sort.by(Sort.Direction.DESC, "id"));
    }
}
