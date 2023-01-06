import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
// import { MainComponent } from './private-home/main/main.component';

//import { SysUserPersonalInfoComponent } from './sysUser/sysUser-personalInfo.component' ;


const routes: Routes = [

  //  { path: '',   redirectTo: '/main', pathMatch: 'full' },


  {
    //path: '',component:MainComponent,
    children: [
      /*
      {
        path: 'personal-infos' ,
        component: SysUserPersonalInfoComponent
      }*/
    ]
  }

];
@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class PrivateRoutingModule { }
