import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { BackboneComponent } from '../share/backbone/backbone.component';
import { DashboardComponent } from './components/dashboard/dashboard.component';
import { EventDetailsComponent } from './components/event-details/event-details.component';
import { EventComponent } from './components/event/event.component';

const routes: Routes = [
  {
    path: '',
    component: DashboardComponent
  },
  {
    path: 'event/:event_id',
    component: EventComponent
  }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class DashboardRoutingModule { }
