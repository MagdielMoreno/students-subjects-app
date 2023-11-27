import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { environment } from 'src/environments/environment';
import { StudentsSubjects } from './students-subjects';

@Injectable({
  providedIn: 'root'
})
export class StudentsSubjectsService {

  private apiServerUrl = environment.apiBaseUrl;
  
  constructor(private http: HttpClient) { }

  public getStudentSubjects(): Observable<StudentsSubjects[]>{
    return this.http.get<StudentsSubjects[]>(`${this.apiServerUrl}/students/getSubjects`);
  }

  public addStudentSubject(studentId: number, subjectId: number): Observable<void>{
    return this.http.post<void>(`${this.apiServerUrl}/students/addSubject/${studentId}/${subjectId}`, null);
  }

  public deleteStudentSubject(studentId: number, subjectId: number): Observable<void>{
    console.log(studentId + " " + subjectId);
    return this.http.delete<void>(`${this.apiServerUrl}/students/deleteSubject/${studentId}/${subjectId}`);
  }
}
