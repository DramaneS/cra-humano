import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { HomeCompanyComponent } from './home-company/home-company.component';
import { HomeUserComponent } from './home-user/home-user.component';

const routes: Routes = [
  { path: '',component:HomeUserComponent },

  { path: 'compagny',component:HomeCompanyComponent },

];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class PrivateHomeRoutingModule { }
