import { Component,  OnInit,ContentChildren,QueryList, ContentChild,TemplateRef, Renderer2  , OnDestroy , ViewChild, ElementRef  , EventEmitter, Input, Output ,   ChangeDetectionStrategy } from '@angular/core';
import { environment } from "src/environments/environment";
import { UtilsService } from 'src/app/shared/services/utils.service' ;


import { AwkaaDataTableConfig } from "src/app/modules/custom/awkaa-dataTable-config";
import { AwkaaDataTableSort } from "src/app/modules/custom/awkaa-dataTable-sort";
import { AwkaaDataTableHeaderCellComponent } from 'src/app/modules/custom/awkaa-dataTable-header-cell.component';

import { map } from 'rxjs/operators';
import { Observable } from 'rxjs';
import { HttpClient, HttpHeaders , HttpErrorResponse , HttpParams } from '@angular/common/http';
import { ActivatedRoute , Router  , NavigationStart } from '@angular/router';


@Component({
  selector: 'awkaa-dataTable',
  templateUrl: './awkaa-dataTable.component.html',
  styleUrls: ['./awkaa-dataTable.component.css'],
  host: {
   '(window:resize)': 'onResize($event)'
  }
})
export class AwkaaDataTableComponent implements OnInit {

    //@ViewChild(MatPaginator) paginator: MatPaginator;
    @Input()  config : AwkaaDataTableConfig = null ;
    loading : boolean = false ;
    //dataSource = new MatTableDataSource<PeriodicElement>(ELEMENT_DATA);


    @ContentChild('templateLoadingSpinner') templateLoadingSpinner : TemplateRef<unknown>;
     @ContentChild('templateHeader') templateHeader : TemplateRef<unknown>;
     @ContentChild('templateBody') templateBody : TemplateRef<unknown>;
     @ContentChildren(AwkaaDataTableHeaderCellComponent , { descendants: true }) headerCells : QueryList<AwkaaDataTableHeaderCellComponent>;


    constructor(
     private renderer: Renderer2,
     private elementRef: ElementRef ,
     private route: ActivatedRoute,
     private routeNav : Router ,
     private http : HttpClient ,
     private utilsService : UtilsService ,

   ) {

     this.config = {id:"",title:""};
  }

  ngOnInit(): void {


          if( this.config["displayHeader"] == undefined || this.config["displayHeader"] == null ){
              this.config["displayHeader"] = false;
          }
          if( this.config["displayFooter"] == undefined ){
              this.config["displayFooter"] = false;
          }
          if( this.config["displaySorter"] == undefined ){
              this.config["displaySorter"] = true;
          }
          if( this.config["displayFilterTrigger"] == undefined ){
              this.config["displayFilterTrigger"] = false;
          }

          if( this.config["displayPaginator"] == undefined ){
              this.config["displayPaginator"] = false;
          }
          if( this.config["displayPaginatorRecapHeader"] == undefined ){
              this.config["displayPaginatorRecapHeader"] = false;
          }
          if( this.config["displayPaginatorRecapFooter"] == undefined ){
              this.config["displayPaginatorRecapFooter"] = true;
          }

          if( this.config["displayPaginatorPageSizeChooser"] == undefined ){
              this.config["displayPaginatorPageSizeChooser"] = false;
          }
          if( this.config["displayPaginatorPageChooser"] == undefined ){
              this.config["displayPaginatorPageChooser"] = false;
          }
          if( this.config["filterTriggerTargetId"] == undefined ){
              this.config["filterTriggerTargetId"] = "";
          }

          if( this.config["dataItemTotal"] == undefined ){
              this.config["dataItemTotal"] = 0;
          }
          if( this.config["dataItemFirstRank"] == undefined ){
              this.config["dataItemFirstRank"] = 0;
          }
          if( this.config["dataItemLastRank"] == undefined ){
              this.config["dataItemLastRank"] = 0;
          }
          if( this.config["dataItemPageTotal"] == undefined ){
              this.config["dataItemPageTotal"] = 0;
          }

          if( this.config["paginatorPageSize"] == undefined ){
              this.config["paginatorPageSize"] = 20;
          }
          if( this.config["paginatorPageSizeChoices"] == undefined ){
              this.config["paginatorPageSizeChoices"] = [10,20,30,40,50];
          }
          if( this.config["paginatorPage"] == undefined ){
              this.config["paginatorPage"] = 1;
          }


          if( this.config["urlParamSorter"] == undefined ){
              this.config["urlParamSorter"] = "sort";
          }

          if( this.config["urlParamPaginatorPageSize"] == undefined ){
              this.config["urlParamPaginatorPageSize"] = "pageSize";
          }
          if( this.config["urlParamPaginatorPage"] == undefined ){
              this.config["urlParamPaginatorPage"] = "page";
          }
          if( this.config["urlParamFormData"] == undefined ){
              this.config["urlParamFormData"] = [];
          }
          if( this.config["displayedColumns"] == undefined ){
              this.config["displayedColumns"] = [];
          }



          if( this.config["url"] == undefined ){
              this.config["url"] = "";
          }

          if( this.config["urlMethod"] == undefined ){
              this.config["urlMethod"] = "get";
          }

          if( this.config["data"] == undefined ){
              this.config["data"] = [];
          }


          if( this.config["dataResponseProp"] == undefined ){
              this.config["dataResponseProp"] = "data";
          }
          if( this.config["dataItemTotalResponseProp"] == undefined ){
              this.config["dataItemTotalResponseProp"] = "total_rows";
          }
          if( this.config["dataItemTotalContainerResponseProp"] == undefined ){
              this.config["dataItemTotalContainerResponseProp"] = "";
          }
          if( this.config["dataItemPageTotalResponseProp"] == undefined ){
              this.config["dataItemPageTotalResponseProp"] = "total_pages";
          }
          if( this.config["dataItemPageTotalContainerResponseProp"] == undefined ){
              this.config["dataItemPageTotalContainerResponseProp"] = "";
          }
  }

  ngAfterViewInit() {


    //on fragment change event
    this.routeNav.events.subscribe((val) => {

      //check fragment change finish
      if( val instanceof NavigationStart )
      {
        //get the url and split from fragment caracter
        let parts = val['url'].split('#') ;
        //get the fragment if present
        let fragment_ = (parts.length >1 ) ? parts[1] : "";
        //set the state of form with fragmant para,s
        this.setStateFromUrl(fragment_);
        //this.load();

      }
    });


    //get the fragment on load
    let fragment = this.route.snapshot.fragment ;


      //if the fragment is present from the load of page
     if( fragment !=  null)
     {
       //set the state from url

       setTimeout(() => {
         this.setStateFromUrl(fragment);

       }, 1500);
       //this.load();

     }

  }



  loadDataSource(){
    /**
     *
     */


  }

  setDefaultValue(){
    /*
    for (let i = 0; i <  this.config['dataSource'].length; i++) {
      this.config['value'][i] = false ;
    }
    */
  }
  getState(){
    //return this.config['valueFormatted'] ;
  }

  setExcludeDate(exclude){

  }

  getStateWithUrlParam(format ?){

    let fragment = this.route.snapshot.fragment ;
    let fragmentData = this.utilsService.getFragmentAsObject( fragment ) ;
    let listData = {};

    listData[ this.config["urlParamSorter"] ] = this.config["sorter"]['id'];
     listData[ this.config["urlParamPaginatorPageSize"] ] = this.config["paginatorPageSize"];
    listData[ this.config["urlParamPaginatorPage"] ] = this.config["paginatorPage"];

    let toSent = { ...fragmentData  ,  ...listData} ;

    if( format != undefined && format == "array"){

      let sentt = [];
      Object.entries(toSent).forEach(([key, value]) => {
          sentt.push(key);
       }) ;
      toSent =  sentt ;
    }

    return toSent ;

    /*
    let param = {  } ;
    let urlParam  = this.config['urlParam'] ! ;
    let values = [];

    //console.log('-.+');
    //console.log(this.config['valueFormatted']);
    //console.log('-.,');

    for (let i = 0; i <  this.config['valueFormatted'].length; i++) {
      let val = this.config['valueFormatted'][i] ;

      if(val != "" ){
        values.push(val);
      }
    }
    param[urlParam] = ( values.length > 0  ) ? values.join(',') : "" ;

    return param ;*/
  }


  onSort($event){
    let sorterId = "" ;
      for( let i = 0; i <  this.headerCells.length; i++) {
        if( this.headerCells.get(i) != undefined )
        {
          this.headerCells.get(i).manageState($event['id'] ) ;
          let val = this.headerCells.get(i).getValue(  ) ;
          if(val != ""){
               sorterId = val ;
          }
        }
      }

      for( let i = 0 ; i <  this.config['sorters'].length ; i++) {
         if( sorterId == this.config['sorters'][i]["id"] ){
           this.config['sorter'] = this.config['sorters'][i] ;
            break ;
         }
      }

      this.setStateFromClient();

   }

  setStateFromData(){

  }


  setStateFromUrl( fragment ){

    let fragmentData = this.utilsService.getFragmentAsObject( fragment ) ;

    let urlParamSorter = this.config['urlParamSorter']  ;
     let urlParamPaginatorPageSize = this.config['urlParamPaginatorPageSize']  ;
    let urlParamPaginatorPage = this.config['urlParamPaginatorPage']  ;


      if(    fragmentData[urlParamSorter] != undefined
          && fragmentData[urlParamSorter] != ''
       )
     {
       for( let i = 0 ; i <  this.config['sorters'].length ; i++) {

          if( fragmentData[urlParamSorter] == this.config['sorters'][i]["id"] ){
            this.config['sorter'] = this.config['sorters'][i] ;
            break ;
          }
       }
     }



     if(    fragmentData[urlParamPaginatorPageSize] != undefined
         && fragmentData[urlParamPaginatorPageSize] != ''
      )
     {
       this.config['paginatorPageSize'] = fragmentData[urlParamPaginatorPageSize] ;
     }

     if(    fragmentData[urlParamPaginatorPage] != undefined
         && fragmentData[urlParamPaginatorPage] != ''
      )
     {
       this.config['paginatorPage'] = fragmentData[urlParamPaginatorPage] ;
     }


     let sorterCellActiveId = "" ;

     for( let i = 0; i <  this.headerCells.length; i++) {
       if( this.headerCells.get(i) != undefined )
       {

         let sorterCellActiveIdCurrent = this.headerCells.get(i).setValue( this.config['sorter']['id'] ) ;
          if(sorterCellActiveIdCurrent != ""){
              sorterCellActiveId = sorterCellActiveIdCurrent ;
         }
       }
     }

     for( let i = 0 ; i <  this.headerCells.length ; i++) {
        this.headerCells.get(i).setSorterCellActiveId(sorterCellActiveId) ;
      }

     this.load();

  }

  load(){

    let fragment = this.route.snapshot.fragment ;
    let fragmentFormData = this.utilsService.getFragmentAsObjectProjections(fragment  , this.config["urlParamFormData"] )  ;
    let listData = {};


    listData[ this.config["urlParamSorter"] ] = this.config["sorter"]['id'];
     listData[ this.config["urlParamPaginatorPageSize"] ] = this.config["paginatorPageSize"];
    listData[ this.config["urlParamPaginatorPage"] ] = this.config["paginatorPage"];

    let toSent = { ...fragmentFormData  ,  ...listData} ;


    if( this.config['urlMethod'] == 'post' )
    {
        this.loading = true ;

        this.http.post( this.config["url"] , toSent ).subscribe( res => {

          this.loading = false ;

          if(  res[this.config["dataResponseProp"]] != undefined  ){
              this.config['data'] = res[this.config["dataResponseProp"]];
          }

          if(  res[this.config["dataItemTotalContainerResponseProp"]] != undefined  )
          {
            if(  res[this.config["dataItemTotalContainerResponseProp"]][this.config["dataItemTotalResponseProp"]] != undefined  )
            {
              this.config['dataItemTotal'] = res[this.config["dataItemTotalContainerResponseProp"]][this.config["dataItemTotalResponseProp"]];
            }
          }
          else
          {
            if(  res[this.config["dataItemTotalResponseProp"]] != undefined  )
            {
              this.config['dataItemTotal'] = res[this.config["dataItemTotalResponseProp"]];
            }
          }


          if(  res[this.config["dataItemPageTotalContainerResponseProp"]] != undefined  )
          {
            if(  res[this.config["dataItemPageTotalContainerResponseProp"]][this.config["dataItemPageTotalResponseProp"]] != undefined  )
            {
              this.config['dataItemPageTotal'] = res[this.config["dataItemPageTotalContainerResponseProp"]][this.config["dataItemPageTotalResponseProp"]];
            }
          }
          else
          {
            if(  res[this.config["dataItemPageTotalResponseProp"]] != undefined  )
            {
              this.config['dataItemPageTotal'] = res[this.config["dataItemPageTotalResponseProp"]];
            }
          }

          this.config['dataItemFirstRank'] =   ( ( Number(this.config['paginatorPage']) - 1) * Number(this.config['paginatorPageSize']) )  +1;
          this.config['dataItemLastRank'] =   this.config['dataItemFirstRank'] + this.config['data'].length  - 1;


        },
        error => {
          this.loading = false ;
        }) ;
    }
    else
    {


      let headers = new HttpHeaders({
                                      'X-RapidAPI-Key': '8ab834e548msh35e34b0ca78f0d3p116d07jsn48de4b8e6b99',
                                      'X-RapidAPI-Host': 'free-nba.p.rapidapi.com'
                                   }
                                 );
      let options = { headers : headers };

      this.loading = true ;

      const queryParamsString = new HttpParams({ fromObject : toSent }).toString();

      this.http.get( this.config["url"] + '?' + encodeURI( queryParamsString) , options  ).subscribe( res => {

        this.loading = false ;

        if(  res[this.config["dataResponseProp"]] != undefined  ){
            this.config['data'] = res[this.config["dataResponseProp"]];
         }

        if(  res[this.config["dataItemTotalContainerResponseProp"]] != undefined  )
        {
          if(  res[this.config["dataItemTotalContainerResponseProp"]][this.config["dataItemTotalResponseProp"]] != undefined  )
          {
            this.config['dataItemTotal'] = res[this.config["dataItemTotalContainerResponseProp"]][this.config["dataItemTotalResponseProp"]];
          }
        }
        else
        {
          if(  res[this.config["dataItemTotalResponseProp"]] != undefined  )
          {
            this.config['dataItemTotal'] = res[this.config["dataItemTotalResponseProp"]];
          }
        }


        if(  res[this.config["dataItemPageTotalContainerResponseProp"]] != undefined  )
        {
          if(  res[this.config["dataItemPageTotalContainerResponseProp"]][this.config["dataItemPageTotalResponseProp"]] != undefined  )
          {
            this.config['dataItemPageTotal'] = res[this.config["dataItemPageTotalContainerResponseProp"]][this.config["dataItemPageTotalResponseProp"]];
          }
        }
        else
        {
          if(  res[this.config["dataItemPageTotalResponseProp"]] != undefined  )
          {
            this.config['dataItemPageTotal'] = res[this.config["dataItemPageTotalResponseProp"]];
          }
        }

        this.config['dataItemFirstRank'] =   ( ( Number(this.config['paginatorPage']) - 1) * Number(this.config['paginatorPageSize']) )  +1;
        this.config['dataItemLastRank'] =   this.config['dataItemFirstRank'] + this.config['data'].length  - 1;


      },
      error => {
        this.loading = false ;
      }) ;

    }

  }



  setStateFromClient(){

    let fragment = this.route.snapshot.fragment ;
    let fragmentData = this.utilsService.getFragmentAsObject( fragment ) ;
    let listData = {};

    listData[ this.config["urlParamSorter"] ] = this.config["sorter"]['id'];
     listData[ this.config["urlParamPaginatorPageSize"] ] = this.config["paginatorPageSize"];
    listData[ this.config["urlParamPaginatorPage"] ] = this.config["paginatorPage"];

    let toSent = { ...fragmentData  ,  ...listData} ;

    let httpParams = this.utilsService.objectToHttpParamsNotEmpty( toSent  );

    this.routeNav.navigate([], { fragment: httpParams.toString() });

  }



  onStateChange(){


  }

  resetState(){

    /*
    for (let i = 0; i <  this.config['dataSource'].length; i++) {

        this.config['valueFormatted'][i] = "" ;

        this.config['value'][i] = false ;

    }*/
  }



 setStateSorterFromClient(sorter){
    this.config['sorter'] = sorter ;
    this.setStateFromClient() ;
    //  this.setStateUrl();

 }

 setStatePaginatorPageSizeFromClient(size){
   this.config['paginatorPageSize'] = size ;
   this.config['paginatorPage'] = 1 ;
   console.log(size);
   this.setStateFromClient() ;
   //this.setStateFromUrl();

 }
 setStatePaginatorPageFromClient(){
   //this.config['paginatorPage'] = page ;
   //console.log(page);
   this.setStateFromClient() ;
   //this.setStateFromUrl();

 }

 paginatePrevious(){

   let preview = ( (  Number(  this.config['paginatorPage']) - 1 ) >= 1   ) ? true : false ;

   if( preview )
   {
     this.config['paginatorPage']--;
   }
   else
   {
     return  ;
   }

   this.setStateFromClient() ;
   //this.setStateFromUrl();

 }

 paginateNext(){

     //test if next exist
     let next = ( ( Number( this.config['paginatorPage']) + 1  ) < Number(this.config['dataItemTotal'] )   ) ? true : false ;

     if( next == true )
     {
        this.config['paginatorPage']++;
     }
     else
     {
       return  ;
     }

     this.setStateFromClient() ;
     //this.setStateFromUrl();

 }


}
