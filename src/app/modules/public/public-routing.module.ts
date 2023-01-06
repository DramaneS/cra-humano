import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';



//import { ContactUsComponent } from './pages/contactUs.component' ;



const routes: Routes = [
  {
    path: '',
    children: [
      /*
      {
        path: 'test-form-filter' ,
        component: TestFormFilterComponent
      } */
    ]
  },
  

];
@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class PublicRoutingModule { }
