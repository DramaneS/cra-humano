import { Component, OnInit, Renderer2, OnDestroy, ViewChild, ElementRef, EventEmitter, Input, Output } from '@angular/core';
import { environment } from "src/environments/environment";
import { ActivatedRoute, Router } from '@angular/router';


@Component({
  selector: 'app-public-connnexion',
  templateUrl: './main.component.html',
  styleUrls: ['./main.component.css'],
  host: {
    '(window:resize)': 'onResize($event)'
  }
})
export class MainComponent implements OnInit {


  public _environment = environment;
  public year = new Date().getFullYear();;
  constructor(


  ) {
  }

  ngOnInit(): void {
  }

  ngAfterViewInit() {
  }

}
