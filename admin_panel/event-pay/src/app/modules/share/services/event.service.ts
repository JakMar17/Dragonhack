import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Event } from '../../dashboard/classes/event.class';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class EventService {

  constructor(
    protected http: HttpClient
  ) { }

  public getActiveEvents(e: Event): Observable<Event[]> {
        return this.http.post<any>('https://dragon.sven.marela.team/admin/events', e);
  }
}
