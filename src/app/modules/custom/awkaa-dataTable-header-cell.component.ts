import { Component,   OnInit, Renderer2  , OnDestroy , ViewChild, ElementRef  , EventEmitter, Input, Output } from '@angular/core';
import { environment } from "src/environments/environment";
import { UtilsService } from 'src/app/shared/services/utils.service' ;



 import { map } from 'rxjs/operators';
import { Observable } from 'rxjs';
import { HttpClient, HttpHeaders , HttpErrorResponse , HttpParams } from '@angular/common/http';
import { ActivatedRoute , Router } from '@angular/router';

@Component({
  selector: 'awkaa-dataTable-header-cell',
  templateUrl: './awkaa-dataTable-header-cell.component.html',
  styleUrls: ['./awkaa-dataTable-header-cell.component.css'],
  host: {
   '(window:resize)': 'onResize($event)'
  }
})
export class AwkaaDataTableHeaderCellComponent implements OnInit {


    @Output('onSort') onSortEventEmitter : EventEmitter<any> = new EventEmitter();

    @Input()  id : string  = "";
    @Input()  title : string  = "";
    @Input()  titleAlign : string  = "center";


    @Input()  sortable : boolean = false ;

    @Input()  sorterUp : string = "";
    @Input()  sorterDown : string = "";

    sorterState : string   = "";
    sorterCellActiveId : string  = "";




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
  }

  setSorterCellActiveId(sorterCellActiveId){
    this.sorterCellActiveId = sorterCellActiveId ;
  }

  manageState( sorterCellActiveId ){

    this.sorterCellActiveId = sorterCellActiveId ;
    //si sortable
    if(this.sortable == true ){
      //si egal a celui selectionnee
      if( sorterCellActiveId == this.id )
      {
        if( this.sorterState == 'up' ){
          this.sorterState = 'down';
        }else {
          this.sorterState = 'up';
        }
      }
    }
  }


  getValue(){
    let value = "";
    if(this.sortable == true && this.id == this.sorterCellActiveId){
      if( this.sorterState == 'up' ){
        value = this.sorterUp ;
      } else {
        value = this.sorterDown ;
      }
    }
    return value ;
  }


  setValue( value ){
    if( this.sortable == true ){
      if( this.sorterUp == value ) {
          this.sorterState = 'up' ;
          this.sorterCellActiveId = this.id ;
      } else if( this.sorterDown == value ) {
        this.sorterState = 'down' ;
        this.sorterCellActiveId = this.id ;
      }
    }
    return this.sorterCellActiveId ;
  }

  requestSortChange( ){
    if( this.sortable == true ){
     this.onSortEventEmitter.emit(
      {
        id : this.id ,
      }
     );
    }
  }

  loadDataSource(){
  }

  setDefaultValue(){


  }
  getState(){



  }

  getStateWithUrlParam(){

  }

  setStateFromData(){

  }

  /**
   *
   *
   *
   */
  setStateFromUrl( fragment  : string ){

  }

  setStateFromClient(){


  }

  onStateChange(){


  }

  resetState(){




  }


}
