import { Component,   OnInit, Renderer2  , OnDestroy , ViewChild, ElementRef  , EventEmitter, Input, Output } from '@angular/core';
import { environment } from "src/environments/environment";


@Component({
  selector: 'app-header-private',
  templateUrl: './header-private.component.html',
  styleUrls: ['./header-private.component.css'],
  host: {
   '(window:resize)': 'onResize($event)'
  }
})
export class HeaderPrivateComponent implements OnInit {

  public containerHeight : string = '500px' ;
  public headerHeight : number = 60 ;
  public menuMavigationDisplay : boolean = true ;
  public sideBarMinWidth : string = '300px' ;
// { icon : "pi pi-home" } , { label : "Mahi" }
public _environment = environment ;



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
