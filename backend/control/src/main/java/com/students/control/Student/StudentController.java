package com.students.control.Student;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.students.control.StudentSubject.StudentSubject;
import com.students.control.StudentSubject.StudentSubjectService;

@RestController
@RequestMapping("/students")
public class StudentController {
    private final StudentService studentService;
    private final StudentSubjectService studentSubjectService;

    public StudentController(StudentService studentService, StudentSubjectService studentSubjectService){
        this.studentService = studentService;
        this.studentSubjectService = studentSubjectService;
    }

    @RequestMapping("/all")
    public ResponseEntity<List<Student>> getAllStudents(){
        List<Student> students = studentService.findAllStudents();
        return new ResponseEntity<>(students, HttpStatus.OK);
    }

    @GetMapping("/get/{id}")
    public ResponseEntity<Student> getStudent(@PathVariable("id") Long id){
        Student student = studentService.findStudent(id);
        return new ResponseEntity<>(student, HttpStatus.OK);
    }

    @PostMapping("/add")
    public ResponseEntity<Student> addStudent(@RequestBody Student student){
        Student newStudent = studentService.addStudent(student);
        return new ResponseEntity<>(newStudent, HttpStatus.CREATED);
    }

    @PutMapping("/update/{id}")
    public ResponseEntity<Student> updateStudent(@PathVariable("id") Long id, @RequestBody Student student){
        student.setId(id);
        Student newStudent = studentService.updateStudent(student);
        return new ResponseEntity<>(newStudent, HttpStatus.OK);
    }

    @DeleteMapping("/delete/{id}")
    public ResponseEntity<?> deleteStudent(@PathVariable("id") Long id){
        studentService.deleteStudent(id);
        return new ResponseEntity<>(HttpStatus.OK);
    }

    @PostMapping("/addSubject/{studentId}/{subjectId}")
    public ResponseEntity<Student> addSubject(@PathVariable("studentId") Long studentId, @PathVariable("subjectId") Long subjectId){
        studentSubjectService.addStudentSubject(studentId, subjectId);
        return new ResponseEntity<>(HttpStatus.OK);
    }

    @PutMapping("/updateSubject/{studentSubjectId}/{studentId}/{subjectId}")
    public ResponseEntity<StudentSubject> updateSubject(@PathVariable("studentSubjectId") Long id, @PathVariable("studentId") Long studentId, @PathVariable("subjectId") Long subjectId){
        StudentSubject studentSubject = new StudentSubject(studentId, subjectId);
        studentSubject.setId(id);
        studentSubject.setStudentId(studentId);
        studentSubject.setSubjectId(subjectId);
        StudentSubject newStudentSubject = studentSubjectService.updateStudentSubject(studentSubject);
        return new ResponseEntity<>(newStudentSubject, HttpStatus.OK);
    }

    @DeleteMapping("/deleteSubject/{studentId}/{subjectId}")
    public ResponseEntity<?> deleteSubject(@PathVariable("studentId") Long studentId, @PathVariable("subjectId") Long subjectId){
        studentSubjectService.deleteStudentSubject(studentId, subjectId);
        return new ResponseEntity<>(HttpStatus.OK);
    }

    @GetMapping("/getSubjects")
    public ResponseEntity<List<StudentSubject>> getSubjects(){
        List<StudentSubject> studentSubjects = studentSubjectService.findStudentSubjects();
        return new ResponseEntity<>(studentSubjects, HttpStatus.OK);
    }
}
