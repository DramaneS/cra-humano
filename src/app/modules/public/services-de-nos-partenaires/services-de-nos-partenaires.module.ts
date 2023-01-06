import { CUSTOM_ELEMENTS_SCHEMA, NgModule ,NO_ERRORS_SCHEMA } from '@angular/core';

//import { BrowserModule } from '@angular/platform-browser'
import { CommonModule } from '@angular/common';
import { HttpClientModule } from '@angular/common/http';
import { ReactiveFormsModule } from '@angular/forms';
import { FormsModule } from '@angular/forms';
import { ServicesDeNosPartenairesRoutingModule } from './services-de-nos-partenaires-routing.module';

import { MainComponent } from './main/main.component' ;

@NgModule({
  declarations : [
    MainComponent ,
  ],
  imports : [
    ServicesDeNosPartenairesRoutingModule,
    CommonModule,
    HttpClientModule ,
    ReactiveFormsModule,
    FormsModule ,
  ],
  providers: [
  ],
  schemas : [ CUSTOM_ELEMENTS_SCHEMA , NO_ERRORS_SCHEMA ]
})
export class ServicesDeNosPartenairesModule { }




// import { Component, OnInit, OnDestroy , ViewChild, ElementRef  , EventEmitter, Input, Output} from '@angular/core';
// import { FormsModule } from '@angular/forms';  // <<<< import it here
// import { NgbModal, NgbModalOptions } from '@ng-bootstrap/ng-bootstrap';
// import { UtilsService } from 'src/app/shared/services/utils.service';
// import { AuthService } from 'src/app/shared/services/auth.service';

// import { HttpClient , HttpHeaders , HttpErrorResponse , HttpParams } from '@angular/common/http';
// import { ActivatedRoute , Router  ,NavigationEnd , NavigationStart } from '@angular/router';

// @Component({
//   selector : 'services-de-nos-partenaires',
//   templateUrl : './services-de-nos-partenaires.component.html' ,
//   styleUrls : [ './services-de-nos-partenaires.component.scss' ] ,
//   host: {
//    '(window:resize)': 'onResize($event)'
//   }
// })
// export class ServicesDeNosPartenairesComponent implements OnInit {


//   collaborators : [] ;
//   loadingProjet : boolean = false ;
//   loadingProjetCount : number = 0 ;

//   public listData = {

//         default : {
//           display : "list" ,
//           sort : "creation_date" ,
//           page : 1 ,
//           per_page : 10 ,

//           total_pages : 0 ,
//           total_rows : 0 ,
//           data : Array()

//         } ,
//         url : {
//           display : "" ,
//           sort : "order_by" ,
//           page : "page" ,
//           per_page : "per_page" ,
//         } ,
//         current : {
//           display : "list" ,
//           sort : "creation_date" ,
//           page : 1 ,
//           per_page : 10 ,

//           page_item_start : 0 ,
//           page_item_end : 0 ,

//           total_pages : 0 ,
//           total_rows : 0 ,
//           data : Array()
//         }

//     } ;


//     constructor(
//       public modalService : NgbModal ,
//       private utilsService : UtilsService ,
//       private authService : AuthService ,
//       public http : HttpClient  ,
//       private routeNav : Router ,
//       private route: ActivatedRoute
//   ) { }
//   ngOnInit(): void {

//   }

//   ngAfterViewInit() {
//     this.search(  );

//   }

//   onResize(event){
//     //this.setHtmlElementsHeight() ;

//   }


//   search(  )
//   {

//     this.loadingProjet = true ;

//     let searchData = {
//       per_page : 4 ,
//       page: 1,
//       order_by : "name_asc"
//     } ;



//     this.http.post(this.utilsService.backendUrl + "/collaborator-search",searchData).subscribe( res => {
//       let collaborators : any[] = [];
//       let receiveData =  res as Object;

//       let data = receiveData["collaborators"] ;

//       this.loadingProjetCount++;

//       Object.entries( ( receiveData["collaborators"] as Array<Object>  ) ).forEach( ( [ key , value ] ) => {

//             let collaborator : any = value  ;

//                 collaborator["image"] = "./assets/images/collaborators/default_company.svg" ;



//              collaborators.push(collaborator   );

//       });

//       //on ajoute les élement venus
//       this.listData['current']['data'] =  collaborators ;


//       this.loadingProjet = false ;

//     },
//     error => {
//       this.loadingProjet = false ;
//     }) ;

//   }
// }
