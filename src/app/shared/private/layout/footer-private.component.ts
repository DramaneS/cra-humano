import { Component,   OnInit, Renderer2  , OnDestroy , ViewChild, ElementRef  , EventEmitter, Input, Output } from '@angular/core';
import { environment } from "src/environments/environment";


@Component({
  selector: 'app-footer-private',
  templateUrl: './footer-private.component.html',
  styleUrls: ['./footer-private.component.css'],
  host: {
   '(window:resize)': 'onResize($event)'
  }
})
export class FooterPrivateComponent implements OnInit {

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
