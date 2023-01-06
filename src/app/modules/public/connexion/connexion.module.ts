import { CUSTOM_ELEMENTS_SCHEMA, NgModule ,NO_ERRORS_SCHEMA } from '@angular/core';

//import { BrowserModule } from '@angular/platform-browser'
import { CommonModule } from '@angular/common';
import { HttpClientModule } from '@angular/common/http';
import { ReactiveFormsModule } from '@angular/forms';
import { FormsModule } from '@angular/forms';
import { ConnexionRoutingModule } from './connexion-routing.module';
import { MdbModalModule } from 'mdb-angular-ui-kit/modal';


import { MainComponent } from './main/main.component';
import { ResetPasswordComponent } from './reset-password/reset-password.component' ;

@NgModule({
  declarations : [
    MainComponent,
    ResetPasswordComponent ,
  ],
  imports : [
    ConnexionRoutingModule,
    CommonModule,
    HttpClientModule ,
    ReactiveFormsModule,
    FormsModule ,    
    MdbModalModule,
  ],
  providers: [
  ],
  schemas : [ CUSTOM_ELEMENTS_SCHEMA , NO_ERRORS_SCHEMA ]
})
export class ConnexionModule { }
