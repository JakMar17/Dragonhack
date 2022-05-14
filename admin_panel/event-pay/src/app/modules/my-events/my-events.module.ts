import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { MyEventsRoutingModule } from './my-events-routing.module';
import { MyEventsComponent } from './components/my-events/my-events.component';


@NgModule({
  declarations: [
    MyEventsComponent
  ],
  imports: [
    CommonModule,
    MyEventsRoutingModule
  ]
})
export class MyEventsModule { }
