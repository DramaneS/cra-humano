import { Component,   OnInit, Renderer2  , OnDestroy , ViewChild, ElementRef  , EventEmitter, Input, Output } from '@angular/core';
import { environment } from "src/environments/environment";
import { UtilsService } from 'src/app/shared/services/utils.service' ;



import { AwkaaFilter } from "src/app/modules/custom/awkaa-filter";
import { map } from 'rxjs/operators';
import { Observable } from 'rxjs';
import { HttpClient, HttpHeaders , HttpErrorResponse , HttpParams } from '@angular/common/http';
import { ActivatedRoute , Router } from '@angular/router';

@Component({
  selector: 'awkaa-filter-date',
  templateUrl: './awkaa-filter-date.component.html',
  styleUrls: ['./awkaa-filter-date.component.css'],
  host: {
   '(window:resize)': 'onResize($event)'
  }
})
export class AwkaaFilterDateComponent implements OnInit {

    @Input()  filter : AwkaaFilter = { id : "" , title : "" , value : { value : "" , switch : "0" , min : "" , max : "" }  };





   constructor(
     private renderer: Renderer2,
     private elementRef: ElementRef ,
     private route: ActivatedRoute,
     private routeNav : Router ,
     private http : HttpClient ,
     private utilsService : UtilsService ,

   ) {

     this.filter["value"] = { value : "" , switch : "1" , min : "" , max : "" };


  }


  ngOnInit(): void {


    if( this.filter["urlParamSwitch"] == undefined  ){
        this.filter["urlParamSwitch"] = this.filter.urlParam + "__switch" ;
    }

    if( this.filter["urlParamMax"] == undefined ){
        this.filter["urlParamMax"] = this.filter.urlParam  + "__max" ;
    }

    if( this.filter["urlParamMin"] == undefined ){
        this.filter["urlParamMin"] = this.filter.urlParam  + "__min" ;
    }

  }

  ngAfterViewInit() {



    //load the data
    this.loadDataSource() ;


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

    this.filter['value'] = { value : "" , switch : "1" , min : "" , max : "" } ;
    //this.filter["value"] = { value : "" , switch : "1" , min : "" , max : "" };


  }
  getState(){


    return this.filter['valueFormatted'] ;

  }

  getStateWithUrlParam(){
    //let param = {  } ;
    //let urlParam  = this.filter['urlParam'] ! ;
    //param[urlParam] = this.filter['valueFormatted'][''] ;

    return this.filter['valueFormatted'] ;
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
     let urlParamSwitch  = this.filter['urlParamSwitch'] ! ;
     let urlParamMin  = this.filter['urlParamMin'] ! ;
     let urlParamMax  = this.filter['urlParamMax'] ! ;


       if(    urlParam != undefined
           && fragmentData[urlParam] != undefined
           && fragmentData[urlParam] != ''
        )
      {
          this.filter['value']['value'] = fragmentData[urlParam]  ;
      }
      else
      {
        this.filter['value']['value'] = "" ;
      }


      if(    urlParam != undefined
          && fragmentData[urlParamSwitch] != undefined
          && fragmentData[urlParamSwitch] != ''
       )
     {
         this.filter['value']['switch'] = fragmentData[urlParamSwitch]  ;
     }
     else
     {
       this.filter['value']['switch'] = "" ;
     }

      if(    urlParam != undefined
          && fragmentData[urlParamMin] != undefined
          && fragmentData[urlParamMin] != ''
       )
     {
         this.filter['value']['min'] = fragmentData[urlParamMin]  ;
     }
     else
     {
       this.filter['value']['min'] = "" ;
     }

     if(    urlParam != undefined
         && fragmentData[urlParamMax] != undefined
         && fragmentData[urlParamMax] != ''
      )
    {
        this.filter['value']['max'] = fragmentData[urlParamMax]  ;
    }
    else
    {
      this.filter['value']['max'] = "" ;
    }

    this.filter['valueFormatted'] = {};
    this.filter['valueFormatted'][urlParam] =   this.filter['value']['value'] ;
    this.filter['valueFormatted'][urlParamSwitch] =   this.filter['value']['switch'] ;
    this.filter['valueFormatted'][urlParamMin] =   this.filter['value']['min'] ;
    this.filter['valueFormatted'][urlParamMax] =   this.filter['value']['max'] ;

  }

  setStateFromClient(){
    //console.log(":::--[[[[]]]]-::");
    //console.log(this.filter['value']);
    //console.log("::++[[[[]]]]+:::");
    let urlParam  = this.filter['urlParam'] ! ;
    let urlParamSwitch  = this.filter['urlParamSwitch'] ! ;
    let urlParamMin  = this.filter['urlParamMin'] ! ;
    let urlParamMax  = this.filter['urlParamMax'] ! ;

    this.filter['valueFormatted'] = {};
    this.filter['valueFormatted'][urlParam] =   this.filter['value']['value'] ;
    this.filter['valueFormatted'][urlParamSwitch] =   this.filter['value']['switch'] ;
    this.filter['valueFormatted'][urlParamMin] =   this.filter['value']['min'] ;
    this.filter['valueFormatted'][urlParamMax] =   this.filter['value']['max'] ;


  }

  onStateChange(){


  }

  resetState(){


        let urlParam  = this.filter['urlParam'] ! ;
        let urlParamSwitch  = this.filter['urlParamSwitch'] ! ;
        let urlParamMin  = this.filter['urlParamMin'] ! ;
        let urlParamMax  = this.filter['urlParamMax'] ! ;

         this.filter['valueFormatted'][urlParam] =   "" ;
        this.filter['valueFormatted'][urlParamSwitch] =   "1" ;
        this.filter['valueFormatted'][urlParamMin] =   "" ;
        this.filter['valueFormatted'][urlParamMax] =  "" ;

        this.filter['value']['value'] =   "" ;
        this.filter['value']['switch'] =   "1" ;
        this.filter['value']['min'] =   "" ;
        this.filter['value']['max'] =  "" ;

  }


}
