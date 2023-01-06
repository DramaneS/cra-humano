import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { RegionDataListComponent } from './region/region-dataList.component';
import { RegionDataTableComponent } from './region/region-dataTable.component';
import { RegionFormEditComponent } from './region/region-formEdit.component';
import { RegionFormViewComponent } from './region/region-formView.component';
import { TestComponent } from './test/test.component';

const routes: Routes = [
  { path : '', component:TestComponent },
  { path : 'list', component:RegionDataListComponent },
  { path : 'table', component:RegionDataTableComponent },
  { path : 'edit', component:RegionFormEditComponent },
  { path : 'view', component:RegionFormViewComponent }

];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class RegionsRoutingModule { }
