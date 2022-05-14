import { Component, Input, OnInit } from '@angular/core';
import { Event } from '../../classes/event.class';

@Component({
  selector: 'app-event-details',
  templateUrl: './event-details.component.html',
  styleUrls: ['./event-details.component.scss']
})
export class EventDetailsComponent implements OnInit {

  @Input() event: Event | null = null;

  constructor() { }

  ngOnInit(): void {
  }

}
