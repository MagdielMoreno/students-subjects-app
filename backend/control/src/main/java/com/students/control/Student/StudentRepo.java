package com.students.control.Student;

import org.springframework.data.jpa.repository.JpaRepository;

public interface StudentRepo extends JpaRepository<Student, Long>{
    void deleteStudentById(Long id);
    Student findStudentById(Long id);
}
