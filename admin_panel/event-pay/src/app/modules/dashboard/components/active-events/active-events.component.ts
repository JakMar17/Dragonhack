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

  activeEvents: any;

  constructor(
    private eventService: EventService
  ) { }

  ngOnInit(): void {
    this.getAllEvents();
  }

  getAllEvents() {
    this.activeEvents = this.eventService.getAllEvents('Matjaž');
    console.log(this.activeEvents)
    this.activeEvents.subscribe((res: any)=>console.log(res))
  }

  log() {
    this.activeEvents?.subscribe((res: any) => console.log(res))
  }
}
