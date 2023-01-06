import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { UtilisateurRoutingModule } from './utilisateur-routing.module';
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
    UtilisateurRoutingModule,
    MdbModalModule,
  ]
})
export class UtilisateurModule { }
