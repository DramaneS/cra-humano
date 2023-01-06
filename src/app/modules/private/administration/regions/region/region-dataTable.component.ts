
import { Component, OnInit, Renderer2, OnDestroy, ViewChild, ElementRef, EventEmitter, Input, Output } from "@angular/core";
import { Location } from "@angular/common";
import { environment } from "src/environments/environment";
declare var bindOnePageNavigationEventsAutomatic;
import { UtilsService } from "src/app/shared/services/utils.service";

import { ActivatedRoute, Router } from "@angular/router";
import { AwkaaFilterFormComponent } from "src/app/modules/custom/awkaa-filter-form.component";
import { AwkaaDataTableComponent } from "src/app/modules/custom/awkaa-dataTable.component";

import { Region } from "../models/region";
import { RegionService } from "src/app/shared/services/region.service";

@Component({
  selector: "region-dataTable",
  templateUrl: "./region-dataTable.component.html",
  styleUrls: ["./region-dataTable.component.css"],
  host: {
    "(window:resize)": "onResize($event)"
  }
})
export class RegionDataTableComponent implements OnInit {

  public _environment = environment;

  @ViewChild("myFilterForm") filterFormRef: AwkaaFilterFormComponent;
  @ViewChild("myDataTable") dataTableRef: AwkaaDataTableComponent;

  @ViewChild("triggerErrorModal") triggerErrorModal: ElementRef<HTMLElement>;
  @ViewChild("triggerLoadingModal") triggerLoadingModal: ElementRef<HTMLElement>;
  @ViewChild("triggerLoadingModalHide") triggerLoadingModalHide: ElementRef<HTMLElement>;
  @ViewChild("errorAlert") errorAlert: ElementRef<HTMLElement>;
  @ViewChild("successAlert") successAlert: ElementRef<HTMLElement>;

  loadingProcess: boolean = false;

  invalid: any = {};

  errors = {
    title: "",
    message: ""
  };

  success = {
    title: "",
    message: ""
  };

  entityToDelete = {} ;



  formDataExcludeUrlParam = [
    "total_pages", "total_rows", "data", "project_start_date_format", "page_item_end", "page_item_start"
  ];

  formData = [

    {
      id: "code",
      title: "Code",
      urlParam: "code",
      name: "code",
      dataSourceUrl: this._environment.apiUrl + "/regions",
      dataSourceUrlResponseProp: "",
      dataSource: [],
      optionId: "id",
      optionName: "name",
      value: "",
    },

    {
      id: "name",
      title: "Nom de la région",
      urlParam: "name",
      name: "name",
      dataSourceUrl: this._environment.apiUrl + "/regions",
      dataSourceUrlResponseProp: "",
      dataSource: [],
      optionId: "id",
      optionName: "name",
      value: "",
    },

  ];

  dataTableData = {

    id: "lisData",
    title: "Liste data 1",
    displayHeader: true,
    displayFooter: true,

    displayFilterTrigger: true,
    displayTemplateSwitch: true,
    displayPaginatorRecapHeader: true,
    filterTriggerTargetId: "staticBackdrop",
    displayPaginatorPageSizeChooser: true,
    displayPaginatorPageChooser: true,
    paginatorPageSize: 10,
    dataItemPageTotal: 3,
    urlParamSorter: "orderBy",
    urlParamPaginatorPageSize: "pageSize",
    urlParamPaginatorPage: "page",
    url: this._environment.apiUrl + "/regions/searchRaw",
    urlMethod: "get",
    dataResponseProp: "data",
    dataItemTotalResponseProp: "total",
    dataItemPageTotalResponseProp: "totalPage",
    dataItemTotalContainerResponseProp: "",
    dataItemPageTotalContainerResponseProp: "",
    headerClass: "",
    bodyClass: "",
    footerClass: "border-top",
  };


  /**
  *
  */
  constructor(
    private renderer: Renderer2,
    private elementRef: ElementRef,
    private route: ActivatedRoute,
    private routeNav: Router,
    private utilsService: UtilsService,
    private _location: Location,
    private regionService: RegionService
  ) {
  }

  /**
  *
  */
  ngOnInit(): void {

  }


  ngAfterViewInit() {
    bindOnePageNavigationEventsAutomatic("one-page-navigation");
  }

  /**
  *
  */
  showLoadingAlertWhole() {
    let el: HTMLElement = this.triggerLoadingModal.nativeElement;
    el.click();
  }


  /**
  *
  */
  hideLoadingAlertWhole() {
    setTimeout(() => {
      let el: HTMLElement = this.triggerLoadingModalHide.nativeElement;
      el.click();
    }, 2000);
  }

  /**
  *
  */
  showErrorAlertWhole(title, message) {

    this.errors.title = title;
    this.errors.message = message;
    let el: HTMLElement = this.triggerErrorModal.nativeElement;
    el.click();
    setInterval(() => {
    }, 1000);
  }

  /**
  *
  */
  showErrorAlert(title, message) {
    this.errors.title = title;
    this.errors.message = message;

    let el: HTMLElement = this.errorAlert.nativeElement;
    el.classList.remove("hide");
    el.classList.add("show");

    setTimeout(() => {
      el.classList.remove("show");
      el.classList.add("hide");
    }, this._environment.alertDelay);

  }

  /**
  *
  */
  showSuccesAlert(title, message) {
    this.success.title = title;
    this.success.message = message;

    let el: HTMLElement = this.successAlert.nativeElement;
    el.classList.remove("hide");
    el.classList.add("show");

    setTimeout(() => {
      el.classList.remove("show");
      el.classList.add("hide");
    }, this._environment.alertDelay);

  }

  /**
  *
  */
  handlerEditionSuccess(title: string, message: string) {
    //hide progress bar
    this.loadingProcess = false;

    this.showSuccesAlert(title, message);
  }

  /**
  *
  */
  handlerEditionError(title: string, message: string) {
    //hide progress bar
    this.loadingProcess = false;

    this.showErrorAlert(title, message);
  }

  /**
  *
  */
  onSortDataTableCell($event) {
    this.dataTableRef.onSort($event);
  }

  /**
  *
  */
  search() {
    let dataTableExludeData = this.dataTableRef.getStateWithUrlParam("array");
    this.filterFormRef.setExcludeData(dataTableExludeData);
    this.filterFormRef.onSearch();
  }

  /**
  *
  */
  resetSearch() {
    let dataTableExludeData = this.dataTableRef.getStateWithUrlParam("array");
    this.filterFormRef.setExcludeData(dataTableExludeData);
    this.filterFormRef.onReset();
  }

  /**
  *
  */
  refresh() {
    this.dataTableRef.load();
  }

  /**
  *
  */
  add() {
    let toSent = {};
    let httpParams = this.utilsService.objectToHttpParamsNotEmpty(toSent);
    this.routeNav.navigate(["test-formEdit"], { fragment: httpParams.toString() });
  }

  /**
  *
  */
  view(entity) {
    let toSent = { id: entity.id };
    let httpParams = this.utilsService.objectToHttpParamsNotEmpty(toSent);
    this.routeNav.navigate(["test-formView"], { fragment: httpParams.toString() });
  }

  /**
  *
  */
  update(entity) {
    let toSent = { id: entity.id };
    let httpParams = this.utilsService.objectToHttpParamsNotEmpty(toSent);
    this.routeNav.navigate(["test-formEdit"], { fragment: httpParams.toString() });
  }


  /**
  *
  */
  openDelete(entity) {
    this.entityToDelete = entity;
  }

  /**
  *
  */
  delete() {

    this.invalid = {};
    this.loadingProcess = true;

    // this.regionService.delete(this.entityToDelete["id"]).subscribe(
    //   response => {
    //     this.loadingProcess = false;
    //     this.handlerEditionSuccess("Confirmation de suppréssion", "L'élément a bien été supprimé!");
    //   },
    //   error => {

    //     this.loadingProcess = false;
    //     var title = (error.error.title != "") ? error.error.title : "Erreur de suppréssion";
    //     var message = (error.error.message != "") ? error.error.message : "Veuillez vérifier les champs!";

    //     this.handlerEditionError(error.error.title, error.error.message);
    //     this.invalid = error.error.errors;

    //   });
  }


  // back() {
  //   this._location.back();
  // }


}
