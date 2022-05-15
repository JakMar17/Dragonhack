import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';

@Component({
  selector: 'app-user',
  templateUrl: './user.component.html',
  styleUrls: ['./user.component.scss']
})
export class UserComponent implements OnInit {

  username: string = 'Kral Matjaž';
  phone_number: string = '123666999';

  public editMode: boolean = false;

  constructor(
    protected router: Router
  ) { }

  ngOnInit(): void {
  }

  public toggleEditMode() {
    this.editMode = !this.editMode;
  }

  logout() {
    localStorage.removeItem('user');
    this.router.navigateByUrl('/');
  }

}
