import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { PrivateHomeRoutingModule } from './private-home-routing.module';
import { MainComponent } from './main/main.component';
import { HomeUserComponent } from './home-user/home-user.component';
import { HomeCompanyComponent } from './home-company/home-company.component';


@NgModule({
  declarations: [
    MainComponent,
    HomeUserComponent,
    HomeCompanyComponent
  ],
  imports: [
    CommonModule,
    PrivateHomeRoutingModule
  ]
})
export class PrivateHomeModule { }
