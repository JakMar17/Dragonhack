import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { DashboardRoutingModule } from './dashboard-routing.module';
import { DashboardComponent } from './components/dashboard/dashboard.component';
import { ActiveEventsComponent } from './components/active-events/active-events.component';
import { NgbModule } from '@ng-bootstrap/ng-bootstrap';
import { EventDetailsComponent } from './components/event-details/event-details.component';


@NgModule({
  declarations: [
    DashboardComponent,
    ActiveEventsComponent,
    EventDetailsComponent
  ],
  imports: [
    CommonModule,
    DashboardRoutingModule,
    NgbModule
  ]
})
export class DashboardModule { }
