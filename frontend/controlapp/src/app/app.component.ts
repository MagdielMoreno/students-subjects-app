import { Component, OnInit } from '@angular/core';
import { HttpErrorResponse } from '@angular/common/http';
import { NgForm } from '@angular/forms';
import { Student } from './student';
import { StudentService } from './student.service';
import { Subject } from './subject';
import { SubjectService } from './subject.service';
import { StudentsSubjects } from './students-subjects';
import { StudentsSubjectsService } from './students-subjects.service';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})

export class AppComponent implements OnInit{

  public students!: Student[];
  public editStudent!: Student;
  public deleteStudent!: Student;

  public subjects!: Subject[];
  public editSubject!: Subject;
  public deleteSubject!: Subject;
  
  public studentsSubjects!: StudentsSubjects[];

  selectedStudentId!: number;
  selectedSubjectId!: number;

  itemsPerPageStudent: number = 6;
  currentPageStudent: number = 1;

  itemsPerPageSubject: number = 9;
  currentPageSubject: number = 1;

  constructor(
    private studentService: StudentService, 
    private subjectService: SubjectService, 
    private studentsSubjectsService: StudentsSubjectsService
  ){}

  ngOnInit(): void {
    this.getStudents();
    this.getSubjects();
    this.getStudentsSubjects();
  }

  //#############Students##############

  //Student Pagination Methods
  getPaginatedStudents(): any[] {
    const startIndex = (this.currentPageStudent - 1) * this.itemsPerPageStudent;
    return this.students.slice(startIndex, startIndex + this.itemsPerPageStudent);
  }

  getPaginationStudentsArray(): number[] {
    const pageCount = Math.ceil(this.students.length / this.itemsPerPageStudent);
    return Array(pageCount).fill(0).map((_, index) => index + 1);
  }

  //CRUD Student Methods
  public getStudents(): void{
    this.studentService.getStudents().subscribe(
      (response: Student[]) => {
        this.students = response;
      },
      (error: HttpErrorResponse) => {
        alert(error.message);
      }
    );
  }

  public onAddStudent(addForm: NgForm): void {
    document.getElementById('add-student-form')?.click();
    console.log(addForm.value);
    this.studentService.addStudent(addForm.value).subscribe(
      (response: Student) => {
        console.log(response);
        this.getStudents();
        addForm.reset();
      },
      (error: HttpErrorResponse) => {
        alert(error.message);
        addForm.reset();
      }
    );
  }

  public onUpdateStudent(id: number, student: Student): void {
    this.studentService.updateStudent(id, student).subscribe(
      (response: Student) => {
        console.log(response);
        this.getStudents();
      },
      (error: HttpErrorResponse) => {
        alert(error.message);
      }
    );
  }

  public onDeleteStudent(id: number): void {
    this.studentService.deleteStudent(id).subscribe(
      (response: void) => {
        console.log(response);
        this.getStudents();
      },
      (error: HttpErrorResponse) => {
        alert(error.message);
      }
    );
  }

  public searchStudents(key: string): void {
    console.log(key);
    const results: Student[] = [];
    for (const student of this.students) {
      if (student.name.toLowerCase().indexOf(key.toLowerCase()) !== -1
      || student.email.toLowerCase().indexOf(key.toLowerCase()) !== -1
      || `${student.phone}`.toLowerCase().indexOf(key.toLowerCase()) !== -1) {
        results.push(student);
      }
    }
    this.students = results;
    if (results.length === 0 || !key) {
      this.getStudents();
    }
  }

  //Control Student Modal Method
  public onOpenStudentModal(student: Student|null, mode: string): void {
    const container = document.getElementById('main-container');
    const button = document.createElement('button');
    button.type = 'button';
    button.style.display = 'none';
    button.setAttribute('data-toggle', 'modal');
    if (mode == 'add') {
      button.setAttribute('data-target', '#addStudentModal');
    }
    if (mode == 'edit') {
      if(student != null) {
        this.editStudent = student;
      }
      button.setAttribute('data-target', '#updateStudentModal');
    }
    if (mode == 'delete') {
      if(student != null) {
        this.deleteStudent = student;
      }
      button.setAttribute('data-target', '#deleteStudentModal');
    }
    if (mode == 'addSubject') {
      if (student != null) {
        this.selectedStudentId = student.id;
      }
      button.setAttribute('data-target', '#addStudentSubjectModal');
    }
    container?.appendChild(button);
    button.click();
  }

  //#############Subjects##############

  //Pagination Subjects Methods
  getPaginatedSubjects(): any[] {
    const startIndex = (this.currentPageSubject - 1) * this.itemsPerPageSubject;
    return this.subjects.slice(startIndex, startIndex + this.itemsPerPageSubject);
  }

  getPaginationSubjectsArray(): number[] {
    const pageCount = Math.ceil(this.subjects.length / this.itemsPerPageSubject);
    return Array(pageCount).fill(0).map((_, index) => index + 1);
  }

  //CRUD Subject Methods
  public getSubjects(): void{
    this.subjectService.getSubjects().subscribe(
      (response: Subject[]) => {
        this.subjects = response;
      },
      (error: HttpErrorResponse) => {
        alert(error.message);
      }
    );
  }

  public onAddSubject(addForm: NgForm): void {
    document.getElementById('add-subject-form')?.click();
    this.subjectService.addSubject(addForm.value).subscribe(
      (response: Subject) => {
        console.log(response);
        this.getSubjects();
        addForm.reset();
      },
      (error: HttpErrorResponse) => {
        alert(error.message);
        addForm.reset();
      }
    );
  }

  public onUpdateSubject(id: number, subject: Subject): void {
    this.subjectService.updateSubject(id, subject).subscribe(
      (response: Subject) => {
        console.log(response);
        this.getSubjects();
      },
      (error: HttpErrorResponse) => {
        alert(error.message);
      }
    );
  }

  public onDeleteSubject(id: number): void {
    this.subjectService.deleteSubject(id).subscribe(
      (response: void) => {
        console.log(response);
        this.getSubjects();
      },
      (error: HttpErrorResponse) => {
        alert("Subject added to a student cannot be removed");
      }
    );
  }

  public searchSubjects(event: any): void {
    const key = (event.target as HTMLInputElement).value;
    console.log(key);
    const results: Subject[] = [];
    for (const subject of this.subjects) {
      if (subject.name.toLowerCase().indexOf(key.toLowerCase()) !== -1) {
        results.push(subject);
      }
    }
    this.subjects = results;
    if (results.length === 0 || !key) {
      this.getSubjects();
    }
  }

  //Control Subject Modal Method
  public onOpenSubjectModal(subject: Subject|null, mode: string): void {
    const container = document.getElementById('main-container');
    const button = document.createElement('button');
    button.type = 'button';
    button.style.display = 'none';
    button.setAttribute('data-toggle', 'modal');
    if (mode == 'add') {
      button.setAttribute('data-target', '#addSubjectModal');
    }
    if (mode == 'edit') {
      if(subject != null) {
        this.editSubject = subject;
      }
      button.setAttribute('data-target', '#updateSubjectModal');
    }
    if (mode == 'delete') {
      if(subject != null) {
        this.deleteSubject = subject;
      }
      button.setAttribute('data-target', '#deleteSubjectModal');
    }
    container?.appendChild(button);
    button.click();
  }

  //#############Student Subjects##############
  public getStudentsSubjects(): void{
    this.studentsSubjectsService.getStudentSubjects().subscribe(
      (response: StudentsSubjects[]) => {
        this.studentsSubjects = response;
      },
      (error: HttpErrorResponse) => {
        alert(error.message);
      }
    );
  }

  getSubjectName(subjectId: number): string {
    const subject = this.subjects.find(s => s.id === subjectId);
    return subject ? subject.name : '';
  }

  getStudentSubjects(studentId: number): StudentsSubjects[] {
    return this.studentsSubjects.filter(ss => ss.studentId === studentId);

  }

  public onDeleteStudentSubject(studentId: number, subjectId: number): void{
    this.studentsSubjectsService.deleteStudentSubject(studentId, subjectId).subscribe(
      ()=> this.resetPage(),
      error => console.error("Error during deleteing", error)
    );
    this.resetPage();
  }

  public onAddStudentSubject(addForm: NgForm): void {
    const subjectId = this.selectedSubjectId;
    document.getElementById('add-student-subject-form')?.click();
    console.log(this.selectedStudentId + " " + subjectId);
    this.studentsSubjectsService.addStudentSubject(this.selectedStudentId, subjectId).subscribe(
      ()=> this.resetPage(),
      error => console.error("Error during adding", error)
    );
    this.resetPage();
  }
  
  //Method that gets non registered by Student Subjects
  getUnregisteredSubjects(studentId: number): any[] {
    const allSubjects = this.subjects;

    const registeredSubjectIds = this.getStudentSubjects(studentId).map((subject) => subject.subjectId);
    return allSubjects.filter((subject) => !registeredSubjectIds.includes(subject.id));
  }

  //Method that resets page
  resetPage() {
    window.location.reload();
  }

  //Method to control Students pagination
  onPageChangeStudent(pageNumber: number): void {
    this.currentPageStudent = pageNumber;
  }

  //Method to control Subjects pagination
  onPageChangeSubject(pageNumber: number): void {
    this.currentPageSubject = pageNumber;
  }

  //Method to limit number inputs to 10 characters
  yourNumber!: number;
  limitInputLength(event: any, maxLength: number) {
    const input = event.target as HTMLInputElement;
    const inputValue = input.value.toString();

    if (inputValue.length > maxLength) {
      input.value = inputValue.slice(0, maxLength);
      this.yourNumber = +input.value; // Update the bound variable if needed
    }
  }
}
