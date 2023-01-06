import { CUSTOM_ELEMENTS_SCHEMA, NgModule ,NO_ERRORS_SCHEMA } from '@angular/core';

//import { BrowserModule } from '@angular/platform-browser'
import { CommonModule } from '@angular/common';
import { HttpClientModule } from '@angular/common/http';
import { ReactiveFormsModule } from '@angular/forms';
import { FormsModule } from '@angular/forms';

import { PublicRoutingModule } from './public-routing.module';
// import { MainComponent } from './home/main/main.component';
//import { SharedModule } from 'src/app/shared/shared.module';

/*
import { ContactUsComponent } from './pages/contactUs.component' ;
import { SysUserSignInComponent } from './pages/sysUser/sysUser-signin.component' ;
*/
@NgModule({
  declarations : [



  //  ContactUsComponent ,
  //  SysUserSignInComponent


  
    // MainComponent
  ],
  imports: [

    PublicRoutingModule,

    CommonModule,
    HttpClientModule ,
    ReactiveFormsModule,
    FormsModule ,
    //BrowserModule ,


    //SharedModule

  ],
  providers: [


  ],
  schemas : [ CUSTOM_ELEMENTS_SCHEMA , NO_ERRORS_SCHEMA ]
})
export class PublicModule { }
