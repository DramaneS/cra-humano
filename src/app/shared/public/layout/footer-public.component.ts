import { Component,   OnInit, Renderer2  , OnDestroy , ViewChild, ElementRef  , EventEmitter, Input, Output } from '@angular/core';
import { environment } from "src/environments/environment";


@Component({
  selector: 'app-footer-public',
  templateUrl: './footer-public.component.html',
  styleUrls: ['./footer-public.component.css'],
  host: {
   '(window:resize)': 'onResize($event)'
  }
})
export class FooterPublicComponent implements OnInit {

  public containerHeight : string = '500px' ;
  public headerHeight : number = 60 ;
  public menuMavigationDisplay : boolean = true ;
  public sideBarMinWidth : string = '300px' ;
// { icon : "pi pi-home" } , { label : "Mahi" }


  public _environment = environment ;
  public year = new Date().getFullYear();;
  constructor(
    private renderer: Renderer2,
    private elementRef: ElementRef ,
   ) {
  }

  ngOnInit(): void {
  }

  ngAfterViewInit() {
  }

}
