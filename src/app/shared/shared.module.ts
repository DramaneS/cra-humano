import { NgModule  , CUSTOM_ELEMENTS_SCHEMA , NO_ERRORS_SCHEMA} from '@angular/core' ;
import { HttpRequest, HttpHandler, HttpEvent, HttpInterceptor,HTTP_INTERCEPTORS, HttpHeaders } from '@angular/common/http';

import { CommonModule } from '@angular/common' ;
import { RouterModule } from '@angular/router';
import { HttpClientModule } from '@angular/common/http';


import { FooterPublicComponent } from './public/layout/footer-public.component' ;
import { HeaderPublicComponent } from './public/layout/header-public.component' ;
import { LayoutHorizPublicComponent } from './public/layout/layout-horiz-public.component' ;

import { FooterPrivateComponent } from './private/layout/footer-private.component' ;
import { HeaderPrivateComponent } from './private/layout/header-private.component' ;
import { LayoutHorizPrivateComponent } from './private/layout/layout-horiz-private.component' ;

//import { AuthGuardService } from 'src/app/shared/guards/auth-guard.service';
//import { AuthInterceptor } from 'src/app/shared/interceptors/auth-interceptor';



@NgModule({
  declarations : [
    FooterPublicComponent,
    HeaderPublicComponent,
    LayoutHorizPublicComponent ,

    FooterPrivateComponent,
    HeaderPrivateComponent,
    LayoutHorizPrivateComponent ,

  ],
  imports : [
    CommonModule,
    RouterModule,
    HttpClientModule

  ] ,
  providers : [

 
    //AuthGuardService ,
    //{ provide: HTTP_INTERCEPTORS, useClass: AuthInterceptor, multi: true }

  ],

  exports : [
    //FooterComponent,
  //  HeaderComponent,
  //  LayoutHorizComponent ,
  ],
  schemas : [ CUSTOM_ELEMENTS_SCHEMA , NO_ERRORS_SCHEMA ]

})
export class SharedModule { }
