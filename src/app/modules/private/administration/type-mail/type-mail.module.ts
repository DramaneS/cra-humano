import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { TypeMailRoutingModule } from './type-mail-routing.module';
import { AjouterComponent } from './ajouter/ajouter.component';
import { MainComponent } from './main/main.component';
import { MdbModalModule } from 'mdb-angular-ui-kit/modal';


@NgModule({
  declarations: [
    AjouterComponent,
    MainComponent
  ],
  imports: [
    CommonModule,
    TypeMailRoutingModule,
    MdbModalModule
  ]
})
export class TypeMailModule { }
