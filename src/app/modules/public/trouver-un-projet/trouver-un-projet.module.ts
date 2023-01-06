import { CUSTOM_ELEMENTS_SCHEMA, NgModule ,NO_ERRORS_SCHEMA } from '@angular/core';

//import { BrowserModule } from '@angular/platform-browser'
import { CommonModule } from '@angular/common';
import { HttpClientModule } from '@angular/common/http';
import { ReactiveFormsModule } from '@angular/forms';
import { FormsModule } from '@angular/forms';
import { TrouverUnProjetRoutingModule } from './trouver-un-projet-routing.module';

import { MainComponent } from './main/main.component' ;

@NgModule({
  declarations : [
    MainComponent ,
  ],
  imports : [
    TrouverUnProjetRoutingModule,
    CommonModule,
    HttpClientModule ,
    ReactiveFormsModule,
    FormsModule ,
  ],
  providers: [
  ],
  schemas : [ CUSTOM_ELEMENTS_SCHEMA , NO_ERRORS_SCHEMA ]
})
export class TrouverUnProjetModule { }
