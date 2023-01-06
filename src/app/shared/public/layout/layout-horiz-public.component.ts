import { Component,   OnInit, Renderer2  , OnDestroy , ViewChild, ElementRef  , EventEmitter, Input, Output } from '@angular/core';
import { environment } from "src/environments/environment";
import { ActivatedRoute , Router ,RouterEvent ,NavigationStart,NavigationEnd,NavigationCancel,NavigationError,Event } from '@angular/router';


@Component({
  selector: 'layout-horiz-public',
  templateUrl: 'layout-horiz-public.component.html',
  styleUrls: ['layout-horiz-public.component.css'],
  host: {
   '(window:resize)': 'onResize($event)'
  }
})
export class LayoutHorizPublicComponent implements OnInit {

  public containerHeight : string = '500px' ;
  public headerHeight : number = 60 ;
  public menuMavigationDisplay : boolean = true ;
  public sideBarMinWidth : string = '300px' ;
// { icon : "pi pi-home" } , { label : "Mahi" }

  public _environment = environment ;


  constructor(
    private renderer: Renderer2,
    private elementRef: ElementRef ,
    private router: Router
   ) {


  }

  ngOnInit(): void {
  }

  ngAfterViewInit() {
  
  }

}
