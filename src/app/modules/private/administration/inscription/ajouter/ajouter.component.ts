import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { Router } from '@angular/router';
import { AdministrationService } from '../../administration.service';

@Component({
  selector: 'app-ajouter',
  templateUrl: './ajouter.component.html',
  styleUrls: ['./ajouter.component.css']
})
export class AjouterComponent implements OnInit {

  modalRef: any;
  admin : any;
  isSubmitted = true;
  ins: any;

  constructor(
    private service : AdministrationService,
    private router : Router,
    private formBuilder : FormBuilder
  ) { }

  ngOnInit(): void {

  }





}
