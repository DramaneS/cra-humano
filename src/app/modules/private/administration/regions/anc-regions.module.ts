import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { RegionsRoutingModule } from './anc-regions-routing.module';

import { RegionDataListComponent } from './region/region-dataList.component';
import { RegionDataTableComponent } from './region/region-dataTable.component';
import { RegionFormEditComponent } from './region/region-formEdit.component';
import { RegionFormViewComponent } from './region/region-formView.component';
import { AwkaaDataListComponent } from 'src/app/modules/custom/awkaa-dataList.component';
import { AwkaaDataTableHeaderCellComponent } from 'src/app/modules/custom/awkaa-dataTable-header-cell.component';
import { AwkaaDataTableComponent } from 'src/app/modules/custom/awkaa-dataTable.component';
import { AwkaaFilterCheckboxComponent } from 'src/app/modules/custom/awkaa-filter-checkbox.component';
import { AwkaaFilterComboComponent } from 'src/app/modules/custom/awkaa-filter-combo.component';
import { AwkaaFilterDateComponent } from 'src/app/modules/custom/awkaa-filter-date.component';
import { AwkaaFilterFormComponent } from 'src/app/modules/custom/awkaa-filter-form.component';
import { AwkaaFilterNumberComponent } from 'src/app/modules/custom/awkaa-filter-number.component';
import { AwkaaFilterRadioComponent } from 'src/app/modules/custom/awkaa-filter-radio.component';
import { AwkaaFilterRangeSliderComponent } from 'src/app/modules/custom/awkaa-filter-rangeSlider.component';
import { AwkaaFilterSwitchComponent } from 'src/app/modules/custom/awkaa-filter-switch.component';
import { AwkaaFilterTextComponent } from 'src/app/modules/custom/awkaa-filter-text.component';
import { BrowserModule } from '@angular/platform-browser';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { NgxSliderModule } from '@angular-slider/ngx-slider';
import { HttpClientModule } from '@angular/common/http';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
// import { BrowserAnimationsModule } from '@angular/platform-browser/animations';


@NgModule({
  declarations: [
    // RegionDataListComponent,
    // RegionDataTableComponent,
    // RegionFormEditComponent,
    // RegionFormViewComponent,

    // AwkaaFilterComboComponent,
    // AwkaaFilterRadioComponent,
    // AwkaaFilterCheckboxComponent,
    // AwkaaFilterTextComponent,
    // AwkaaFilterNumberComponent,
    // AwkaaFilterDateComponent,
    // AwkaaFilterSwitchComponent,
    // AwkaaFilterRangeSliderComponent,
    // AwkaaFilterFormComponent,
    // AwkaaDataListComponent,
    // AwkaaDataTableHeaderCellComponent,
    // AwkaaDataTableComponent,
    // TestComponent,
  ],
  imports: [
    CommonModule,
    RegionsRoutingModule,
    BrowserModule,
    HttpClientModule ,
    ReactiveFormsModule,
    FormsModule ,
    
    // FormsModule,
    NgxSliderModule,
    // ReactiveFormsModule,
    // HttpClientModule,
    // BrowserAnimationsModule  

  ]
})
export class RegionsModule { }
