import { Component, OnInit } from '@angular/core';
import { Observable } from 'rxjs';
import { EventService } from 'src/app/modules/share/services/event.service';
import { Event } from '../../classes/event.class';

@Component({
  selector: 'app-active-events',
  templateUrl: './active-events.component.html',
  styleUrls: ['./active-events.component.scss']
})
export class ActiveEventsComponent implements OnInit {

  activeEvents: Observable<Event[]> = new Observable<Event[]>();

  constructor(
    private eventService: EventService
  ) { }

  ngOnInit(): void {
    
  }

  postEvent() {
    let e = new Event({
      eventName: 'Majske igre',
      description: 'Mi nismo pijanci',
      location: 'Ljubljana',
      dates: [{
        eventStart: new Date(1),
        eventEnd: new Date(2),
        description: 'traja za vedno'
      }],
      trr: '1231231231',
      image: 'image',
      cardImage: 'card image',
      workerUsername: 'Matjaž Bizjak'
    });
    this.activeEvents = this.eventService.getActiveEvents(e);
    console.log(this.activeEvents);
    this.activeEvents.subscribe(e => console.log(e));
  }

}
