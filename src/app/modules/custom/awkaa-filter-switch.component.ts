import { Component,   OnInit, Renderer2  , OnDestroy , ViewChild, ElementRef  , EventEmitter, Input, Output } from '@angular/core';
import { environment } from "src/environments/environment";
import { UtilsService } from 'src/app/shared/services/utils.service' ;



import { AwkaaFilter } from "src/app/modules/custom/awkaa-filter";
import { map } from 'rxjs/operators';
import { Observable } from 'rxjs';
import { HttpClient, HttpHeaders , HttpErrorResponse , HttpParams } from '@angular/common/http';
import { ActivatedRoute , Router } from '@angular/router';

@Component({
  selector: 'awkaa-filter-switch',
  templateUrl: './awkaa-filter-switch.component.html',
  styleUrls: ['./awkaa-filter-switch.component.css'],
  host: {
   '(window:resize)': 'onResize($event)'
  }
})
export class AwkaaFilterSwitchComponent implements OnInit {

    @Input()  filter : AwkaaFilter = { id : "" , title : "" , value : "" , label : "" };
    label : string = "";
  constructor(
    private renderer: Renderer2,
    private elementRef: ElementRef ,
    private route: ActivatedRoute,
    private routeNav : Router ,
    private http : HttpClient ,
    private utilsService : UtilsService ,

  ) {

  }
  ngOnInit(): void {

  }

  ngAfterViewInit() {


    if( this.filter['value'] == undefined ){
        this.filter['value'] = false ;
    }

    if( this.filter['valueFormatted'] == undefined ){
        this.filter['valueFormatted'] = "0";
    }

    if( this.filter['label'] != undefined ){
      this.label = this.filter['label'];
    }
    
  }

  setDefaultValue(){

    this.filter['value'] = false ;


  }
  getState(){
    return this.filter['valueFormatted'] ;
  }

  getStateWithUrlParam(){
    let param = {  } ;
    let urlParam  = this.filter['urlParam'] ! ;

    param[urlParam] = this.filter['valueFormatted'] ;

    return param ;
  }

  setStateFromData(){

  }

  /**
   *
   *
   *
   */
  setStateFromUrl( fragment  : string ){
     let fragmentData = this.utilsService.getFragmentAsObject( fragment ) ;
     let urlParam  = this.filter['urlParam'] ! ;


       if(    urlParam != undefined
           && fragmentData[urlParam] != undefined
           && fragmentData[urlParam] != ''

        )
      {
          this.filter['value'] = ( fragmentData[urlParam] == '1' ) ? true : false ;
      }else {
          this.filter['value'] = false ;
      }

      this.filter['valueFormatted'] = ( this.filter['value'] == true ) ? '1' : '0' ;

  }

  setStateFromClient(){
     this.filter['valueFormatted'] = ( this.filter['value'] == true ) ? '1' : '0' ;
  }

  onStateChange(){

  }

  resetState(){
    this.filter['value'] = false ;
    this.filter['valueFormatted'] = "0" ;
  }


}

