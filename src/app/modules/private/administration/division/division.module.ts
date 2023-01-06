import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { DivisionRoutingModule } from './division-routing.module';
import { MainComponent } from './main/main.component';
import { AjouterComponent } from './ajouter/ajouter.component';
import { MdbModalModule } from 'mdb-angular-ui-kit/modal';


@NgModule({
  declarations: [
    MainComponent,
    AjouterComponent
  ],
  imports: [
    CommonModule,
    DivisionRoutingModule,
    MdbModalModule,
  ]
})
export class DivisionModule { }
