import { TestBed } from '@angular/core/testing';

import { StudentsSubjectsService } from './students-subjects.service';

describe('StudentsSubjectsService', () => {
  let service: StudentsSubjectsService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(StudentsSubjectsService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
