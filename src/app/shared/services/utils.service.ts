import { Injectable } from '@angular/core';
 import {Router,ActivatedRoute} from '@angular/router';
import { map} from 'rxjs/operators';
import { Observable} from 'rxjs';
import { HttpClientModule,HttpClient, HttpHeaders, HttpErrorResponse ,HttpParams} from '@angular/common/http';
//import jwt_decode from "jwt-decode";
import { ChangeDetectorRef } from '@angular/core';

import { environment } from './../../../environments/environment';

@Injectable({
  providedIn: 'root'
})
export class UtilsService {

  //backend of the
  //backendUrl : string = "https://demohumano.cra-afrique.com/api/v1" ;
/*  backendUrl : string =  "http://humano-api.clicgrh.com/api/v1" ;


  frontEndPrivateUrl : string =  "https://localhost:4200" ;//"https://demohumano.cra-afrique.com"  ;
  frontEndPublicUrl : string =  "https://localhost:54959" ;//"https://humano.mineytou.com";


  remotePermittedLogoutDomain : string = "https://localhost:4200";
  remotePermittedLoginDomain : string = "https://localhost:4200";
  remoteLogoutComponent : string = "https://localhost:4200/logout-remotly";
  remoteLoginComponent : string = "https://localhost:4200/login-remotly";


    /*

  frontEndPrivateUrl : string = "http://humano-private.clicgrh.com" ; // "https://demohumano.cra-afrique.com"; //  "https://localhost:4200"  ; //"https://demohumano.cra-afrique.com"  ;
  frontEndPublicUrl : string =  "http://humano-public.clicgrh.com" ; // "http://humano-public.cra-afrique.com";   //     "https://localhost:54959" ; //"https://humano.mineytou.com";
  remotePermittedLogoutDomain : string = "http://humano-private.clicgrh.com" ; //"https://demohumano.cra-afrique.com"; //           "https://localhost:4200";
  remotePermittedLoginDomain : string = "http://humano-private.clicgrh.com" ; //"https://demohumano.cra-afrique.com";     //        "https://localhost:4200";
  remoteLogoutComponent : string =  "http://humano-private.clicgrh.com/logout-remotly" ; //  "https://localhost:4200/logout-remotly";
  remoteLoginComponent : string =   "http://humano-private.clicgrh.com/login-remotly" ; //  "https://localhost:4200/login-remotly";



*/

/*


  frontEndPrivateUrl : string =   "http://localhost:4200"  ;
  frontEndPublicUrl : string =   "http://localhost:4201" ;
  remotePermittedLogoutDomain : string = "http://localhost:4200";
  remotePermittedLoginDomain : string =   "http://localhost:4200";
  remoteLogoutComponent : string =   "http://localhost:4200/logout-remotly";
  remoteLoginComponent : string =  "http://localhost:4200/login-remotly";

*/

frontEndPrivateUrl : string = "http://humano-private.coophumano.com" ;
frontEndPublicUrl : string =  "http://humano-public.coophumano.com" ;
remotePermittedLogoutDomain : string = "http://humano-private.coophumano.com" ;
remotePermittedLoginDomain : string = "http://humano-private.coophumano.com" ;
remoteLogoutComponent : string =  "http://humano-private.coophumano.com/logout-remotly" ;
remoteLoginComponent : string =   "http://humano-private.coophumano.com/login-remotly" ;




  constructor( private router : Router ,
               private route : ActivatedRoute ,
               private http : HttpClient    ) {
  }



  getFragmentAsObject(fragment : string){

    let parts = (fragment != null ) ? fragment.split('&') : "";
    let params = {} ;

    Object.entries( parts ).forEach( ( [ key , part ] ) => {
      const pieces = part.split('=');
      if(pieces.length == 2)
      {
        params[pieces[0]] = pieces[1];
      }
    });

    return params
  }

  getFragmentAsObjectProjections(fragment : string , projection ){

    let parts = (fragment != null ) ? fragment.split('&') : "";
    let params = {} ;

    Object.entries( parts ).forEach( ( [ key , part ] ) => {
      const pieces = part.split('=');

      if( pieces.length == 2   &&  projection.indexOf(pieces[0]) >= 0  )
      {
        params[pieces[0]] = pieces[1];
      }
    });

    return params
  }



  objectToHttpParamsNotEmpty( source , excludeParams ? ) {

      let toExlude = ( excludeParams != undefined  && excludeParams != null && excludeParams instanceof Array ) ? excludeParams : [] ;
      let destination = {} ;

      Object.entries( ( source as Array<Object>  ) ).forEach( ( [ key , value ] ) => {

        if(  toExlude.indexOf(key) >= 0    )
        {
          return ;
        }

        if( value != "" )
        {
          destination[key] = value ;
        }

      });

      let httpParams = new HttpParams({ fromObject: destination }) ;


      return  httpParams ;
  }


  buildPersitParamsRemoteData( dataSource  )
  {
    let params = new URLSearchParams();

    Object.entries( dataSource ).forEach( ( [ key , value ] ) => {
        let val : string = value as string ;
        params.set( key , val ) ;

    });

    return params.toString();
  }


   validateEmail  (email) {
     return email.match(
     /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/
   );
  }
  /**
   *
   * @dataSource :
   * @config :
   **/
  buildPersitRemoteDataJson( dataSource , config ){
    let retour = {};
    let mapping =  ( config["mapping"] != undefined ) ? config["mapping"] : {} ;
    let includeOthers =  ( config["includeOthers"] != undefined ) ? config["includeOthers"] : false ;

    if( includeOthers == true )
    {
      Object.entries( dataSource ).forEach( ( [ key , value ] ) => {
        let val : string =  value as string ;

        if( mapping[key] == undefined  )
        {
          retour[key] = value ;
        }

      });

    }

    //fetch possible projet images index
    Object.entries( mapping ).forEach( ( [ key , value ] ) => {
      let val : string =  value as string ;

      if( dataSource[key] != undefined  )
      {
        retour[val] = dataSource[key] ;
      }
    });

    return retour ;
  }

  /**
   *
   * @dataSource :
   * @url :
   * @config :
   **/
  loadRemoteData( url  , config , callBackSuccess ? , callBackError ? ) {

    let dataSource = Array();

    let dataWrapper = ( config["dataWrapper"] != undefined ) ? config["dataWrapper"] : "" ;

    this.http.get( url ).subscribe( res => {

      let datas = ( dataWrapper != "" ) ? ( res[dataWrapper]  as any[] ) : ( res as any[] ) ;

      dataSource =  datas ;

      if(callBackSuccess != undefined )
      {

        callBackSuccess(  dataSource );
      }
    },
    error => {

      if(callBackError != undefined )
      {
        callBackError(  dataSource );
      }
    }) ;
  }

  /**
   *
   * @dataSource :
   * @url :
   * @config :
   **/
  loadRemoteDataSelectView( dataSource , url , config ){

    let idField = ( config["idField"] != undefined ) ? config["idField"] : "id" ;
    let labelField = ( config["labelField"] != undefined ) ? config["labelField"] : "label" ;
    let dataWrapper = ( config["dataWrapper"] != undefined ) ? config["dataWrapper"] : "" ;

    this.http.get( url ).subscribe( res => {

      let datas = ( dataWrapper != "" ) ? ( res[dataWrapper]  as any[] ) : ( res as any[] ) ;
      let datass : any [] = [] ;

      //fetch possible projet images index
      Object.entries( datas ).forEach( ( [ key , value ] ) => {

        value["label"] = ( value[labelField] != undefined ) ? value[ labelField ] : "" ;
        value["id"] = ( value[idField] != undefined ) ? value[ idField ] : "" ;

        datass.push( value ) ;

      });

      dataSource =  datass ;

      if(config["callback"] != undefined )
      {
        config["callback"]();
      }

    },
    error => {
    }) ;

  }


    /**
     *
     * @dataSource :
     * @url :
     * @config :
     **/
    formatDateAsLetter( dateParam  ){

      let mois = Array("janvier","février","mars","avril","mai","juin","juillet","août","septembre","octobre","novembre","décembre") ;
      let date = new Date( dateParam ) ;
      let day   = ( date.getDate() < 10 ) ? '0' + date.getDate() : date.getDate() ! ;
      let returne = day + " " + mois[ date.getMonth() ]  + " " + date.getFullYear() ;

      return returne ;
    }










    parseDateForSearch(val: string, type : string) : string {


    if(val != undefined && val != "")
    {
      let date = new Date(val);
      let month = date.getMonth() + 1   ;
      let day = date.getDate()  ;
      let hour = date.getHours() ;
      let minute = date.getMinutes() ;
      let seconde = date.getSeconds() ;

      let monthString = ( month < 10 ) ? "0" + month : month ;
      let dayString = ( day < 10 ) ? "0" + day : day ;
      let hourString = ( hour < 10 ) ? "0" + hour : hour ;
      let minuteString = ( minute < 10 ) ? "0" + minute : minute ;
      let secondeString = ( seconde < 10 ) ? "0" + seconde : seconde ;

      val = date.getFullYear() +"-"+ monthString + "-" + dayString ;//+ " "+ hourString+ ":" + minuteString+ ":" + secondeString;
      if(type == "full" )
      {
        val = date.getFullYear() +"-"+ monthString + "-" + dayString + " "+ hourString+ ":" + minuteString+ ":" + secondeString;

      }
    }
    return val ;
  }

  parseFilterEntryForSearch(key , operation,val)  {


      switch ( operation )
      {
        case 'equals':
          operation = 'EQUAL';
          break;
        case 'notEquals':
            operation = 'NOT_EQUAL';
            break;
        case 'contains':
          operation = 'MATCH';
          break;
        case 'endsWith':
          operation = 'MATCH_END';
          break;
        case 'startsWith':
            operation = 'MATCH_BEGIN';
            break;
        case 'notContains':
            operation = 'NOT_MATCH';
            break;
        case 'dateIs':
          operation = 'MATCH_DATE';
          val = this.parseDateForSearch(val,"less") ;
          break;
        case 'dateIsNot':
           operation = 'NOT_MATCH_DATE';
            val = this.parseDateForSearch(val,"less") ;
          break;
        case 'dateBefore':
            operation = 'LESS_THAN_DATE';
            val = this.parseDateForSearch(val,"less") ;
            break;
        case 'dateAfter':
            operation = 'GREATER_THAN_DATE';
            val = this.parseDateForSearch(val,"less") ;
            break;
      case 'among':
          operation = 'AMONG';

          if( Array.isArray( val) )
          {
            val = val.join(',');
            /*val = val.slice(1,val.length);
            val = val.slice(0,val.length-1);*/
          }else {
            val = JSON.stringify(val);
            val = val.slice(1,val.length);
            val = val.slice(0,val.length-1);
          }
          break;
        case "lt":
            operation = 'LESS_THAN';
            break;
        case 'gt':
            operation = 'GREATER_THAN';
            break;
        case 'lte':
            operation = 'LESS_THAN_EQUAL';
            break;
        case 'gte':
            operation = 'GREATER_THAN_EQUAL';
            break;
      }


    return {"key":key , "value" : val , "operation" : operation } ;
  }

  getFileNameWithoutExtension( filename )
  {
    let extension = this.getFileExtension( filename ) ;
    let parts = filename.split( extension ) ;
    return parts[0] ;
  }

  getFileExtension(filename)
  {
    /*
      var parts = filename.split('.');
    return parts[parts.length-1];
    */

    return filename.split('.').pop();
  }

  parseSortForSearch( multiSortMeta )  {

      let params = [] ;

      if( multiSortMeta != undefined )
      {
          Object.entries(multiSortMeta).forEach(([key, value]) => {
            let order = ( value["order"] == 1 ) ? "asc" : "desc";
            let field = value["field"] ;
            params.push( { "field" : field , "order" : order } ) ;
          });
      }

      //console.log(params);
      return params;
  }

  parseFilterForSearch(filters)  {
    let filters_converted = [];

    if( filters != undefined )
    {

    Object.entries(filters).forEach(([key, value]) => {
        let returnFilter = {}, key_='',val='',operation='';

        if( Array.isArray( value) )
        {
            for( let i = 0 ; i < value.length ; i++ )
            {
                val =  value[i]['value'] ;
                operation =  value[i]['matchMode'] ;
                key_ = key ;

                if( val != null )
                {
                  returnFilter = this.parseFilterEntryForSearch(key_,operation,val);
                  filters_converted.push( returnFilter );
                }
            }
        }
        else
        {
          val =  value['value'] ;
          operation =  value['matchMode'] ;
          key_ =  'awkaa' ;
          if( val != null )
          {
            returnFilter = this.parseFilterEntryForSearch(key_,operation,val);
            filters_converted.push( returnFilter );
          }
        }

    });

    }

    return filters_converted ;
  }


  parseRemoteApiErrors(errors){

    let returnError = {} ;
    Object.entries(errors).forEach(([key, value]) => {
      let messages =  [] ;
      Object.entries(value).forEach(([keyI , errorI]) => {
        messages.push(errorI["message"]) ;
      });

      returnError[key] = " "+messages.join("\n") + " " ;

    });

    return returnError ;
  }


  isPdfFile( extension ? : string ) : boolean {

    return ( extension != null ) ? [ 'pdf' ].includes( extension ) : false ;

  }

  isImageFile( extension ? : string ) : boolean {

    return ( extension != null ) ? [ 'tif','tiff','bmp','jpg','jpeg','gif','png','eps','raw' ].includes( extension )  : false ;

  }

  isAudioFile( extension ? : string) : boolean {

    return ( extension != null ) ? [ 'mp3' , 'wav' , '3gp' , 'aa' , 'aax' , 'aiff' , 'alac' , 'm4p' ].includes( extension )  : false ;

  }

  isVideoFile( extension ? : string ) : boolean {

    return ( extension != null ) ? ['mp4' , 'flv' , 'flv' , 'mp4' , 'f4p' , 'amv' , 'mov' ].includes( extension )  : false ;

  }

  fileImage() : string {
    return environment.fileImage ;
  }



    convertDataURIToBinary (dataURI){

        var BASE64_MARKER = ';base64,';
        var base64Index = dataURI.indexOf(BASE64_MARKER) + BASE64_MARKER.length;
        var base64 = dataURI.substring(base64Index);
        var raw = window.atob(base64);
        var rawLength = raw.length;
        var array = new Uint8Array(new ArrayBuffer(rawLength));

        for(let cmp = 0; cmp < rawLength; cmp++) {
          array[cmp] = raw.charCodeAt(cmp);
        }
        return array;
    }

    BinaryToBlob(dataURI){

      var binary= this.convertDataURIToBinary(dataURI);
      var blob=new Blob([binary] , { type : 'audio/ogg' } );
      var blobUrl = URL.createObjectURL(blob);

    }


}
