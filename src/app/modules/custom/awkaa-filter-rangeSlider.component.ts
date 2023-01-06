import { Component,   OnInit, Renderer2  , OnDestroy , ViewChild, ElementRef  , EventEmitter, Input, Output } from '@angular/core';
import { environment } from "src/environments/environment";
import { UtilsService } from 'src/app/shared/services/utils.service' ;

import { Options } from "@angular-slider/ngx-slider";


import { AwkaaFilter } from "src/app/modules/custom/awkaa-filter";
import { map } from 'rxjs/operators';
import { Observable } from 'rxjs';
import { HttpClient, HttpHeaders , HttpErrorResponse , HttpParams } from '@angular/common/http';
import { ActivatedRoute , Router } from '@angular/router';

@Component({
  selector: 'awkaa-filter-rangeSlider',
  templateUrl: './awkaa-filter-rangeSlider.component.html',
  styleUrls: ['./awkaa-filter-rangeSlider.component.css'],
  host: {
   '(window:resize)': 'onResize($event)'
  }
})
export class AwkaaFilterRangeSliderComponent implements OnInit {

    @Input()  filter : AwkaaFilter = { id : "" , title : "" , valueMin : 0 , valueMax : 100 };

    public loaded : boolean = true ;


    public optionId  : string = "id" ;
    public optionName : string = "name" ;
    public dataSourceUrlResponseProp : string = "" ;



    options : Options = {
      floor : 0 ,
      ceil : 100
    };



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

    if( this.filter["floor"] == undefined ){
        this.filter["floor"] = 0 ;
    }

    if( this.filter["ceil"] == undefined ){
        this.filter["ceil"] = 100 ;
    }


    this.options =  {
      floor : this.filter["floor"] ,
      ceil : this.filter["ceil"]
    };


  }

  ngAfterViewInit() {


    if( this.filter['valueMin'] == undefined ){
        this.filter['valueMin'] = 0;
    }

    if( this.filter['valueMax'] == undefined ){
        this.filter['valueMax'] = 40 ;
    }


    if( this.filter['valueMinFormatted'] == undefined ){
        this.filter['valueMinFormatted'] = "0" ;
    }

    if( this.filter['valueMaxFormatted'] == undefined ){
        this.filter['valueMaxFormatted'] = "40" ;
    }

    //load the data


  }



  loadDataSource(){
    /**
     *
     */


       this.setDefaultValue();

       //get the  fragment on load
       let fragment = this.route.snapshot.fragment ;
         //if the fragment is present from the load of page
        if( fragment !=  null)
        {
          //set the state from url
          this.setStateFromUrl(fragment);
        }


  }

  setDefaultValue(){

    this.filter['valueMix'] =0 ;
    this.filter['valueMax'] = 40 ;


  }

  getState(){

    return this.filter['valueFormatted'] ;
  }

  getStateWithUrlParam(){
    let param = {  } ;
    let urlParamMin  = this.filter['urlParamMin'] ! ;
    let urlParamMax  = this.filter['urlParamMax'] ! ;
    param[urlParamMin] = this.filter['valueMinFormatted'] ;
    param[urlParamMax] = this.filter['valueMaxFormatted'] ;

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
     let urlParamMin  = this.filter['urlParamMin'] ! ;
     let urlParamMax  = this.filter['urlParamMax'] ! ;

 

       if(    urlParamMin != undefined
           && fragmentData[urlParamMin] != undefined
           && fragmentData[urlParamMin] != ''

        )
      {
          this.filter['valueMin'] = Number(fragmentData[urlParamMin])  ;
      }


       if(    urlParamMax != undefined
           && fragmentData[urlParamMax] != undefined
           && fragmentData[urlParamMax] != ''

        )
      {
          this.filter['valueMax'] = Number(fragmentData[urlParamMax])  ;
      }

      this.filter['valueMinFormatted'] = this.filter['valueMin'].toString();
      this.filter['valueMaxFormatted'] = this.filter['valueMax'].toString();

  }

  setStateFromClient(){

    this.filter['valueMinFormatted'] = this.filter['valueMin'].toString() ;
    this.filter['valueMaxFormatted'] = this.filter['valueMax'].toString() ;

  }

  onStateChange(){

  }

  resetState(){

        this.filter['valueMin'] = 0 ;
        this.filter['valueMinFormatted'] = "0" ;

        this.filter['valueMax'] = 40 ;
        this.filter['valueMaxFormatted'] = "40" ;
  }


}
