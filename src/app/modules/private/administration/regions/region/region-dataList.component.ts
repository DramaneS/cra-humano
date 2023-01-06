
import { Component, OnInit, Renderer2, OnDestroy, ViewChild, ElementRef, EventEmitter, Input, Output } from "@angular/core";
import { Location } from "@angular/common";
import { environment } from "src/environments/environment";
declare var bindOnePageNavigationEventsAutomatic;
import { UtilsService } from "src/app/shared/services/utils.service";

import { ActivatedRoute, Router } from "@angular/router";
import { AwkaaFilterFormComponent } from "src/app/modules/custom/awkaa-filter-form.component";

// import { AwkaaFilterFormComponent } from "../region/AwkaaFilterFormComponent";

import { AwkaaDataListComponent } from "src/app/modules/custom/awkaa-dataList.component";

import { Region } from "../models/region";
import { RegionService } from "src/app/shared/services/region.service";


@Component({
  selector: "region-dataList",
  templateUrl: "./region-dataList.component.html",
  styleUrls: ["./region-dataList.component.css"],
  host: {
    "(window:resize)": "onResize($event)"
  }
})
export class RegionDataListComponent implements OnInit {

  public _environment = environment;

  @ViewChild("myFilterForm") filterFormRef: AwkaaFilterFormComponent;
  @ViewChild("myDataListe") dataListRef: AwkaaDataListComponent;

  @ViewChild("triggerErrorModal") triggerErrorModal: ElementRef<HTMLElement>;
  @ViewChild("triggerLoadingModal") triggerLoadingModal: ElementRef<HTMLElement>;
  @ViewChild("triggerLoadingModalHide") triggerLoadingModalHide: ElementRef<HTMLElement>;
  @ViewChild("errorAlert") errorAlert: ElementRef<HTMLElement>;
  @ViewChild("successAlert") successAlert: ElementRef<HTMLElement>;

  loadingProcess: boolean = false;

  invalid: any = {};

  entityToDelete: any;

  errors = {
    title: "",
    message: ""
  };

  success = {
    title: "",
    message: ""
  };


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


  dataListData = {
    id: "lisData",
    title: "Liste",
    displayHeader: true,
    displayFooter: true,
    displayFilterTrigger: false,
    displayTemplateSwitch: true,
    displayPaginatorRecapHeader: true,
    filterTriggerTargetId: "staticBackdrop",
    templateSwitches: ["card", "list", "grid"],
    templateSwitch: "card",
    sorters: [
      { id: "id,asc", name: "Trier par l'id le plus récent" },
      { id: "id,desc", name: "Trier par l'id le moins récent" },
    ],
    sorter: { id: "id,asc", name: "+Id" },
    displayPaginatorPageSizeChooser: true,
    displayPaginatorPageChooser: true,
    paginatorPageSize: 10,
    dataItemPageTotal: 3,
    urlParamSorter: "order_by",
    urlParamTemplateSwitch: "display_by",
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
    callbackLoad: (data) => {
      let count = 0;
      Object.entries(data).forEach(([key, value]) => {
        if (count % 5 == 0) {
          data[key]["media"] = ["2", "2", "2", "2", "2"];
        } else if (count % 4 == 0) {
          data[key]["media"] = ["2", "2", "2", "2"];
        } else if (count % 3 == 0) {
          data[key]["media"] = ["2", "2", "2"];
        } else if (count % 2 == 0) {
          data[key]["media"] = ["2", "2"];
        } else if (count % 1 == 0) {
          data[key]["media"] = ["2"];
        }
        count++;
      });

      return data;
    }
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

  //   /**
  //   *
  //   */
    showLoadingAlertWhole()
    {
        let el : HTMLElement = this.triggerLoadingModal.nativeElement;
         el.click();
    }


  //   /**
  //   *
  //   */
    hideLoadingAlertWhole()
    {
      setTimeout(() => {
        let el : HTMLElement = this.triggerLoadingModalHide.nativeElement;
          el.click();
      }, 2000);
    }

  //   /**
  //   *
  //   */
    showErrorAlertWhole(title,message)
    {

      this.errors.title = title ;
      this.errors.message = message ;
      let el : HTMLElement = this.triggerErrorModal.nativeElement;
       el.click();
       setInterval( () =>{
       }, 1000);
    }

  //   /**
  //   *
  //   */
    showErrorAlert( title , message )
    {
      this.errors.title = title ;
      this.errors.message = message ;

      let el : HTMLElement = this.errorAlert.nativeElement;
      el.classList.remove("hide");
      el.classList.add("show");

      setTimeout(() => {
        el.classList.remove("show");
        el.classList.add("hide");
      }, this._environment.alertDelay);

    }

  //   /**
  //   *
  //   */
    showSuccesAlert( title , message )
    {
      this.success.title = title ;
      this.success.message = message ;

      let el : HTMLElement = this.successAlert.nativeElement;
      el.classList.remove("hide");
      el.classList.add("show");

      setTimeout(() => {
        el.classList.remove("show");
        el.classList.add("hide");
      }, this._environment.alertDelay);

    }

  //   /**
  //   *
  //   */
    handlerEditionSuccess(title, message) {
      //hide progress bar
      this.loadingProcess = false ;

      this.showSuccesAlert( title , message );
    }

  //   /**
  //   *
  //   */
    handlerEditionError(title : string,message : string) {
      //hide progress bar
      this.loadingProcess = false ;

      this.showErrorAlert( title , message );
    }

  //   /**
  //   *
  //   */
    onSortDataTableCell($event){
      //this.dataListRef.onSort($event);
    }

  //   /**
  //   *
  //   */
    // search(){
    //   let dataTableExludeData = this.dataListRef.getStateWithUrlParam("array");
    //   this.filterFormRef.setExcludeData(dataTableExludeData);
    //   this.filterFormRef.onSearch() ;
    // }

  //   /**
  //   *
  //   */
    // resetSearch(){
    //   let dataTableExludeData = this.dataListRef.getStateWithUrlParam("array");
    //   this.filterFormRef.setExcludeData(dataTableExludeData);
    //   this.filterFormRef.onReset() ;
    // }

  //   /**
  //   *
  //   */
    refresh(){
      this.dataListRef.load();
    }

  //   /**
  //   *
  //   */
    add(){
      let toSent = {  } ;
      let httpParams = this.utilsService.objectToHttpParamsNotEmpty( toSent  );
      this.routeNav.navigate(["test-formEdit"], { fragment: httpParams.toString() });
    }

  //   /**
  //   *
  //   */
    view(entity){
      let toSent = { id : entity.id } ;
      let httpParams = this.utilsService.objectToHttpParamsNotEmpty( toSent  );
      this.routeNav.navigate(["test-formView"], { fragment: httpParams.toString() });
    }

  //   /**
  //   *
  //   */
    update(entity){
      let toSent = { id : entity.id } ;
      let httpParams = this.utilsService.objectToHttpParamsNotEmpty( toSent  );
      this.routeNav.navigate(["test-formEdit"], { fragment: httpParams.toString() });
    }


  //   /**
  //   *
  //   */
    openDelete(entity){
      this.entityToDelete = entity ;
    }

  //   /**
  //   *
  //   */
    delete(){

      this.invalid = {} ;
      this.loadingProcess = true ;

      //make edit request from the service
    this.regionService.delete( this.entityToDelete["id"] ).subscribe(
      response => {
        this.loadingProcess = false ;
         //call the success handler
        this.handlerEditionSuccess( "Confirmation de suppréssion" , "L'élément a bien été supprimé!" ) ;
      },
      error => {

        this.loadingProcess = false ;
        var title = ( error.error.title  != "" ) ?   error.error.title  : "Erreur de suppréssion" ;
        var message = ( error.error.message  != "" ) ?  error.error.message : "Veuillez vérifier les champs!" ;

         //call the error handler
        this. handlerEditionError( error.error.title , error.error.message ) ;
        this.invalid = error.error.errors ;

      });
    }

  //   /**
  //    *
  //    */
    back(){
      this._location.back();
    }

}
