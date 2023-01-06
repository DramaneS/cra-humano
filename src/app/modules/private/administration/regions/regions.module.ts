import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { RegionsRoutingModule } from './regions-routing.module';
import { TestComponent } from './test/test.component';
import { RegionDataListComponent } from './region/region-dataList.component';
import { RegionDataTableComponent } from './region/region-dataTable.component';
import { RegionFormEditComponent } from './region/region-formEdit.component';
import { RegionFormViewComponent } from './region/region-formView.component';

import { AwkaaFilterFormComponent } from 'src/app/modules/custom/awkaa-filter-form.component';
import { NgxSliderModule } from '@angular-slider/ngx-slider';
import { HttpClientModule } from '@angular/common/http';
import { ReactiveFormsModule, FormsModule } from '@angular/forms';
import { AwkaaDataTableComponent } from "../../../custom/awkaa-dataTable.component";
import { AwkaaFilterNumberComponent } from 'src/app/modules/custom/awkaa-filter-number.component';
import { AwkaaFilterTextComponent } from 'src/app/modules/custom/awkaa-filter-text.component';
import { AwkaaDataTableHeaderCellComponent } from 'src/app/modules/custom/awkaa-dataTable-header-cell.component';
import { AwkaaDataListComponent } from 'src/app/modules/custom/awkaa-dataList.component';


@NgModule({
    declarations: [
        TestComponent,
        RegionDataListComponent,
        RegionDataTableComponent,
        RegionFormEditComponent,
        RegionFormViewComponent,
        AwkaaFilterFormComponent,
        AwkaaDataTableComponent,
        AwkaaFilterNumberComponent,
        AwkaaFilterTextComponent,
        AwkaaDataTableHeaderCellComponent,
        AwkaaDataListComponent,

    ],
    imports: [
        CommonModule,
        RegionsRoutingModule,
        HttpClientModule,
        ReactiveFormsModule,
        FormsModule,
        NgxSliderModule,
    ]
})
export class RegionsModule { }
