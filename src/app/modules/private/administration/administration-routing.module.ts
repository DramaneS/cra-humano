import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { MainComponent } from './main/main.component';

const routes: Routes = [

  { path: '',component:MainComponent },

  // {
  //   path : "inscription",
  //   loadChildren : () => import('src/app/modules/private/administration/inscription/inscription.module').then(m =>m.InscriptionModule)
  // }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class AdministrationRoutingModule { }
