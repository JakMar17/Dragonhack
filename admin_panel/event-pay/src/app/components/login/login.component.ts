import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.scss']
})
export class LoginComponent implements OnInit {

  constructor(protected router: Router) { }

  ngOnInit(): void {
  }

  login(): void {
    console.log("sdeasdasd")
    this.router.navigate(['../dashboard'])
      .catch((navigateErr) => console.error(navigateErr));
  }

}
