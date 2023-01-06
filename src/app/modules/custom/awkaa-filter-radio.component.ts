import { Component,   OnInit, Renderer2  , OnDestroy , ViewChild, ElementRef  , EventEmitter, Input, Output } from '@angular/core';
import { environment } from "src/environments/environment";
import { UtilsService } from 'src/app/shared/services/utils.service' ;



import { AwkaaFilter } from "src/app/modules/custom/awkaa-filter";
import { map } from 'rxjs/operators';
import { Observable } from 'rxjs';
import { HttpClient, HttpHeaders , HttpErrorResponse , HttpParams } from '@angular/common/http';
import { ActivatedRoute , Router } from '@angular/router';

@Component({
  selector: 'awkaa-filter-radio',
  templateUrl: './awkaa-filter-radio.component.html',
  styleUrls: ['./awkaa-filter-radio.component.css'],
  host: {
   '(window:resize)': 'onResize($event)'
  }
})
export class AwkaaFilterRadioComponent implements OnInit {

    @Input()  filter : AwkaaFilter = { id : "" , title : "" , value : "" };
    public loaded : boolean = false ;
    public optionId  : string = "id" ;
    public optionName : string = "name" ;
    public dataSourceUrlResponseProp : string = "" ;

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
    if( this.filter["optionId"] == undefined ){
        this.filter["optionId"] = this.optionId ;
    } else if( this.filter["optionId"] != "" ){
      this.optionId = this.filter["optionId"] ;
    }

    if( this.filter["optionName"] == undefined ){
        this.filter["optionName"] = this.optionName ;
    } else if( this.filter["optionName"] != "" ){
      this.optionName = this.filter["optionName"] ;
    }

    if( this.filter["dataSourceUrlResponseProp"] == undefined ){
        this.filter["dataSourceUrlResponseProp"] = this.dataSourceUrlResponseProp ;
    } else if( this.filter["dataSourceUrlResponseProp"] != "" ){
      this.dataSourceUrlResponseProp = this.filter["dataSourceUrlResponseProp"] ;
    }
  }

  ngAfterViewInit() {


    if( this.filter['value'] == undefined ){
        this.filter['value'] = [] ;
    }

    if( this.filter['valueFormatted'] == undefined ){
        this.filter['valueFormatted'] = [] ;
    }

    //load the data
    this.loadDataSource() ;


  }



  loadDataSource(){
    /**
     *
     */
    if(    this.filter['dataSourceUrl'] != undefined
        && this.filter['dataSourceUrl'] != ''   )
    {

            let headers = new HttpHeaders({
                  //'Content-Type': 'application/json',
                  //'Accept': 'application/json',
                  'Access-Control-Allow-Origin':'*',
            });

            let options = { headers : headers };

            let url =   this.filter['dataSourceUrl'] !;

             this.http.get( url   ).subscribe( res => {
               if(this.dataSourceUrlResponseProp == ""){
                 this.filter["dataSource"] = res as Array<any>;
               }else if(res[this.dataSourceUrlResponseProp] != undefined ){
                 this.filter["dataSource"] = res[this.dataSourceUrlResponseProp] as Array<any>;
                 this.loaded = true ;

                 this.setDefaultValue();

                 //get the fragment on load
                 let fragment = this.route.snapshot.fragment ;
                   //if the fragment is present from the load of page
                  if( fragment !=  null)
                  {
                    //set the state from url
                    this.setStateFromUrl(fragment);
                  }

               }
             },
             error => {
             }) ;

     }
     else if(  this.filter['dataSource'] != undefined && this.filter['dataSource'].length > 0  )
     {
       this.loaded = true ;

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
  }

  setDefaultValue(){

    this.filter['value'] = "" ;


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
          this.filter['value'] = fragmentData[urlParam]  ;
      }

      this.filter['valueFormatted'] = this.filter['value'] ;

  }

  setStateFromClient(){


    this.filter['valueFormatted'] = this.filter['value'] ;
  }

  onStateChange(){

  }

  resetState(){

    this.filter['value'] = "" ;
    this.filter['valueFormatted'] = "" ;


  }


}
