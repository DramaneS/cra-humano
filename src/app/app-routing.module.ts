/*import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';

const routes: Routes = [];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
*/

import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { LayoutHorizPublicComponent } from 'src/app/shared/public/layout/layout-horiz-public.component';
import { LayoutHorizPrivateComponent } from 'src/app/shared/private/layout/layout-horiz-private.component';
import { full_content } from 'src/app/shared/routes/full-content-router';


const routes: Routes = [

    { path: 'private',   redirectTo: '/private/private-home', pathMatch: 'full' },

    { path : 'private'
    , component :  LayoutHorizPrivateComponent
    , children : full_content
    },
  

    { path: '',   redirectTo: '/home', pathMatch: 'full' },

    { path : ''
    , component :LayoutHorizPublicComponent
    , children : full_content
    },
    
    

];

@NgModule({
  imports: [[RouterModule.forRoot(routes, {
    //anchorScrolling: 'enabled',
    //scrollPositionRestoration: 'enabled',
    // useHash: true
  })],
],
  exports: [RouterModule]
})
export class AppRoutingModule { }
