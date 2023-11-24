import { Injectable } from '@angular/core';
import { environment } from 'src/environments/environment';
import { Subject } from './subject';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class SubjectService {
  private apiServerUrl = environment.apiBaseUrl;

    constructor(private http: HttpClient){}

    public getSubjects(): Observable<Subject[]>{
        return this.http.get<Subject[]>(`${this.apiServerUrl}/subjects/all`);
    }

    public addSubject(subject: Subject): Observable<Subject>{
        return this.http.post<Subject>(`${this.apiServerUrl}/subjects/add`, subject);
    }

    public updateSubject(id:number, subject: Subject): Observable<Subject>{
        return this.http.put<Subject>(`${this.apiServerUrl}/subjects/update/${id}`, subject);
    }

    public deleteSubject(id: number): Observable<void>{
        return this.http.delete<void>(`${this.apiServerUrl}/subjects/delete/${id}`);
    }
}
