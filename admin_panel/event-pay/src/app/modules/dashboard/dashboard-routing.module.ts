import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { BackboneComponent } from '../share/backbone/backbone.component';
import { DashboardComponent } from './components/dashboard/dashboard.component';

const routes: Routes = [
  {
    path: '',
    component: DashboardComponent
  }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class DashboardRoutingModule { }
