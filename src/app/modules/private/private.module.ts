
import { CUSTOM_ELEMENTS_SCHEMA, NgModule ,NO_ERRORS_SCHEMA } from '@angular/core';

//import { BrowserModule } from '@angular/platform-browser'
import { CommonModule } from '@angular/common';
import { HttpClientModule } from '@angular/common/http';
import { ReactiveFormsModule } from '@angular/forms';
import { FormsModule } from '@angular/forms';

import { PrivateRoutingModule } from './private-routing.module';

//import { SysUserPersonalInfoComponent } from './sysUser/sysUser-personalInfo.component' ;



@NgModule({
  declarations : [

    //SysUserPersonalInfoComponent
  
  ],
  imports: [

    PrivateRoutingModule,

    CommonModule,
    HttpClientModule ,
    ReactiveFormsModule,
    FormsModule ,
    //BrowserModule ,

  ],
  providers: [

  ],
  schemas : [ CUSTOM_ELEMENTS_SCHEMA , NO_ERRORS_SCHEMA ]
})
export class PrivateModule { }
