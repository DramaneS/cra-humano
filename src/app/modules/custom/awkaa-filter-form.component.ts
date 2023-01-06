import { Component,  OnInit,ContentChildren,QueryList, ContentChild,TemplateRef, Renderer2  , OnDestroy , ViewChild, ElementRef  , EventEmitter, Input, Output ,   ChangeDetectionStrategy,
} from '@angular/core';
import { environment } from "src/environments/environment";
import { AwkaaFilterCheckboxComponent } from 'src/app/modules/custom/awkaa-filter-checkbox.component';
import { AwkaaFilterRadioComponent } from 'src/app/modules/custom/awkaa-filter-radio.component';
import { AwkaaFilterComboComponent } from 'src/app/modules/custom/awkaa-filter-combo.component';
import { AwkaaFilterTextComponent } from 'src/app/modules/custom/awkaa-filter-text.component';
import { AwkaaFilterNumberComponent } from 'src/app/modules/custom/awkaa-filter-number.component';
import { AwkaaFilterDateComponent } from 'src/app/modules/custom/awkaa-filter-date.component';
import { AwkaaFilterRangeSliderComponent } from 'src/app/modules/custom/awkaa-filter-rangeSlider.component';

import { AwkaaFilterSwitchComponent } from 'src/app/modules/custom/awkaa-filter-switch.component';

import { UtilsService } from 'src/app/shared/services/utils.service' ;

 /*
import { QuestionOption } from "src/app/modules/certif-test/questions/models/questionOption";
import { QuestionData } from "src/app/modules/certif-test/questions/models/questionData";
*/

import { AwkaaFilter } from "src/app/modules/custom/awkaa-filter";
import { map } from 'rxjs/operators';
import { Observable } from 'rxjs';
import { HttpClient, HttpHeaders, HttpErrorResponse ,HttpParams } from '@angular/common/http';
import { ActivatedRoute , Router , NavigationStart} from '@angular/router';

@Component({
  selector: 'awkaa-filter-form',
  templateUrl: './awkaa-filter-form.component.html',
  styleUrls: ['./awkaa-filter-form.component.css'],
  //changeDetection: ChangeDetectionStrategy.OnPush,
   host: {
   '(window:resize)': 'onResize($event)'
  }
})
export class AwkaaFilterFormComponent implements OnInit {

  @Input()  data : AwkaaFilter [] = Array();
  @Input()  exclude = [] ;

  @ContentChild('templateHeader') templateHeader : TemplateRef<unknown>;
  @ContentChild('templateBody') templateBody : TemplateRef<unknown>;
  @ContentChild('templateFooter') templateFooter : TemplateRef<unknown>;


  @ContentChildren(AwkaaFilterCheckboxComponent , { descendants: true }) checkboxs : QueryList<AwkaaFilterCheckboxComponent>;
  @ContentChildren(AwkaaFilterRadioComponent , { descendants: true }) radios : QueryList<AwkaaFilterRadioComponent>;
  @ContentChildren(AwkaaFilterComboComponent , { descendants: true }) combos : QueryList<AwkaaFilterComboComponent>;
  @ContentChildren(AwkaaFilterTextComponent , { descendants: true }) texts : QueryList<AwkaaFilterTextComponent>;
  @ContentChildren(AwkaaFilterNumberComponent , { descendants: true }) numbers : QueryList<AwkaaFilterNumberComponent>;
  @ContentChildren(AwkaaFilterDateComponent , { descendants: true }) dates : QueryList<AwkaaFilterDateComponent>;
  @ContentChildren(AwkaaFilterSwitchComponent , { descendants: true }) switchs : QueryList<AwkaaFilterSwitchComponent>;
  @ContentChildren(AwkaaFilterRangeSliderComponent , { descendants: true }) rangeSliders : QueryList<AwkaaFilterRangeSliderComponent>;


  constructor(
                  private renderer: Renderer2,
                  private elementRef: ElementRef ,
                  private route: ActivatedRoute,
                  private routeNav : Router ,
                  private utilsService : UtilsService
               ) {

  }

  ngOnInit() {

  }

  ngAfterViewChecked(){




  }


  /**
   *
   */
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

      }
    });


    //get the fragment on load
    let fragment = this.route.snapshot.fragment ;


      //if the fragment is present from the load of page
     if( fragment !=  null)
     {
       setTimeout(() => {
         //set the state from url
         this.setStateFromUrl(fragment);
       }, 2000);



     }

  }

  /**
   *
   */
  getState(){
    let values = {} ;

    for( let i = 0; i <  this.checkboxs.length; i++) {

      if( this.checkboxs.get(i) != undefined )
      {
        let val = this.checkboxs.get(i)!.getStateWithUrlParam() ;
        values =  { ...values , ...val } ;

      }
    }


    for( let i = 0; i <  this.radios.length; i++) {

      if( this.radios.get(i) != undefined )
      {
        let val = this.radios.get(i)!.getStateWithUrlParam() ;

        values =  { ...values , ...val } ;

      }
    }


    for( let i = 0; i <  this.combos.length; i++) {

      if( this.combos.get(i) != undefined )
      {
        let val = this.combos.get(i)!.getStateWithUrlParam() ;

        values =  { ...values , ...val } ;

      }
    }


    for( let i = 0; i <  this.rangeSliders.length; i++) {

      if( this.rangeSliders.get(i) != undefined )
      {
        let val = this.rangeSliders.get(i)!.getStateWithUrlParam() ;

        values =  { ...values , ...val } ;

      }
    }


    for( let i = 0; i <  this.texts.length; i++) {

      if( this.texts.get(i) != undefined )
      {
        let val = this.texts.get(i)!.getStateWithUrlParam() ;

        values =  { ...values , ...val } ;

      }
    }

    for( let i = 0; i <  this.numbers.length; i++) {

      if( this.numbers.get(i) != undefined )
      {
        let val = this.numbers.get(i)!.getStateWithUrlParam() ;

        values =  { ...values , ...val } ;

      }
    }

    for( let i = 0; i <  this.dates.length; i++) {

      if( this.dates.get(i) != undefined )
      {
        let val = this.dates.get(i)!.getStateWithUrlParam() ;

        values =  { ...values , ...val } ;

      }
    }


    for( let i = 0; i <  this.switchs.length; i++) {

      if( this.switchs.get(i) != undefined )
      {
        let val = this.switchs.get(i)!.getStateWithUrlParam() ;

        values =  { ...values , ...val } ;

      }
    }


     return values ;
  }

  /**
   *
   */
  setStateFromData(){


  }

  /**
   * Set the stage of de form from url params
   * @param{url} :
   *
   */
  setStateFromUrl(url : string )
  {
      for (let i = 0; i <  this.checkboxs.length; i++) {

        if(this.checkboxs.get(i) != undefined )
        {
          this.checkboxs.get(i)!.setStateFromUrl(url) ;
        }
      }


      for (let i = 0; i <  this.radios.length; i++) {

        if(this.radios.get(i) != undefined )
        {
          this.radios.get(i)!.setStateFromUrl(url) ;
        }
      }

      for (let i = 0; i <  this.combos.length; i++) {

        if(this.combos.get(i) != undefined )
        {
          this.combos.get(i)!.setStateFromUrl(url) ;
        }
      }



      for (let i = 0; i <  this.rangeSliders.length; i++) {

        if(this.rangeSliders.get(i) != undefined )
        {
          this.rangeSliders.get(i)!.setStateFromUrl(url) ;
        }
      }




      for (let i = 0; i <  this.texts.length; i++) {

        if(this.texts.get(i) != undefined )
        {
          this.texts.get(i)!.setStateFromUrl(url) ;
        }
      }


      for (let i = 0; i <  this.numbers.length; i++) {

        if(this.numbers.get(i) != undefined )
        {
          this.numbers.get(i)!.setStateFromUrl(url) ;
        }
      }

      for (let i = 0; i <  this.dates.length; i++) {

        if(this.dates.get(i) != undefined )
        {
          this.dates.get(i)!.setStateFromUrl(url) ;
        }
      }

      for (let i = 0; i <  this.switchs.length; i++) {

        if(this.switchs.get(i) != undefined )
        {
          this.switchs.get(i)!.setStateFromUrl(url) ;
        }
      }






  }

  /**
   *
   */
  onStateChange(){

  }

  setStateFromClient(){

    for (let i = 0; i <  this.checkboxs.length; i++) {

      if(this.checkboxs.get(i) != undefined )
      {
        this.checkboxs.get(i)!.setStateFromClient() ;
      }
    }

    for (let i = 0; i <  this.radios.length; i++) {

      if(this.radios.get(i) != undefined )
      {
        this.radios.get(i)!.setStateFromClient() ;
      }
    }

    for (let i = 0; i <  this.combos.length; i++) {

      if(this.combos.get(i) != undefined )
      {
        this.combos.get(i)!.setStateFromClient() ;
      }
    }

    for (let i = 0; i <  this.rangeSliders.length; i++) {

      if(this.rangeSliders.get(i) != undefined )
      {
        this.rangeSliders.get(i)!.setStateFromClient() ;
      }
    }



    for (let i = 0; i <  this.texts.length; i++) {

      if(this.texts.get(i) != undefined )
      {
        this.texts.get(i)!.setStateFromClient() ;
      }
    }

    for (let i = 0; i <  this.numbers.length; i++) {

      if(this.numbers.get(i) != undefined )
      {
        this.numbers.get(i)!.setStateFromClient() ;
      }
    }

    for (let i = 0; i <  this.dates.length; i++) {

      if(this.dates.get(i) != undefined )
      {
        this.dates.get(i)!.setStateFromClient() ;
      }
    }

    for (let i = 0; i <  this.switchs.length; i++) {

      if(this.switchs.get(i) != undefined )
      {
        this.switchs.get(i)!.setStateFromClient() ;
      }
    }


  }

  /**
   *
   */
   resetState(){

     for (let i = 0; i <  this.checkboxs.length; i++) {

       if(this.checkboxs.get(i) != undefined )
       {
         this.checkboxs.get(i)!.resetState() ;
       }
     }

     for (let i = 0; i <  this.radios.length; i++) {

       if(this.radios.get(i) != undefined )
       {
         this.radios.get(i)!.resetState() ;
       }
     }

     for (let i = 0; i <  this.combos.length; i++) {

       if(this.combos.get(i) != undefined )
       {
         this.combos.get(i)!.resetState() ;
       }
     }


     for (let i = 0; i <  this.rangeSliders.length; i++) {

       if(this.rangeSliders.get(i) != undefined )
       {
         this.rangeSliders.get(i)!.resetState() ;
       }
     }




     for (let i = 0; i <  this.texts.length; i++) {

       if(this.texts.get(i) != undefined )
       {
         this.texts.get(i)!.resetState() ;
       }
     }

     for (let i = 0; i <  this.numbers.length; i++) {

       if(this.numbers.get(i) != undefined )
       {
         this.numbers.get(i)!.resetState() ;
       }
     }

     for (let i = 0; i <  this.dates.length; i++) {

       if(this.dates.get(i) != undefined )
       {
         this.dates.get(i)!.resetState() ;
       }
     }

     for (let i = 0; i <  this.switchs.length; i++) {

       if(this.switchs.get(i) != undefined )
       {
         this.switchs.get(i)!.resetState() ;
       }
     }




   }


     setExcludeData(exclude){
        this.exclude = exclude;
     }

  /**
   *
   */
  public onSearch(){
    this.setStateFromClient();
    this.setUrlFragment();
   }

  /**
   *
   */
  public onReset(){
    this.resetState();
    this.setUrlFragmentReset();
  }

  /**
   *
   *
   */
   public setUrlFragment(){
     let myData = this.getState();
     let toExludeData = this.utilsService.getFragmentAsObjectProjections(  this.route.snapshot.fragment  , this.exclude );
     let toSent = { ...toExludeData , ...myData } ;
     let httpParams = this.utilsService.objectToHttpParamsNotEmpty( toSent  ) ;
     this.routeNav.navigate([], { fragment : httpParams.toString() });

   }

   /**
    *
    *
    */
    public setUrlFragmentReset(){
      let myData = this.getState();
      let toExludeData = this.utilsService.getFragmentAsObjectProjections(  this.route.snapshot.fragment , this.exclude );
      let toSent = { ...toExludeData , ...myData } ;
      let httpParams = this.utilsService.objectToHttpParamsNotEmpty( toSent  ) ;
      this.routeNav.navigate([], { fragment : httpParams.toString() });

    }

}
