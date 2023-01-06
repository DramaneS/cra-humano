import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { EntrepriseRoutingModule } from './entreprise-routing.module';
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
    EntrepriseRoutingModule,
    MdbModalModule,
  ]
})
export class EntrepriseModule { }
