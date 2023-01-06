
import { Component, OnInit, Renderer2, OnDestroy, ViewChild, ElementRef, EventEmitter, Input, Output } from "@angular/core";
import { Location } from "@angular/common";
import { environment } from "src/environments/environment";
declare var bindOnePageNavigationEventsAutomatic;
import { UtilsService } from "src/app/shared/services/utils.service";
import { ActivatedRoute, Router } from "@angular/router";
import { AwkaaFilterFormComponent } from "src/app/modules/custom/awkaa-filter-form.component";
import { AwkaaDataTableComponent } from "src/app/modules/custom/awkaa-dataTable.component";
import { RegionService } from "src/app/shared/services/region.service";

@Component({
  selector: "region-formView",
  templateUrl: "./region-formView.component.html",
  styleUrls: ["./region-formView.component.css"],
  host: {
    "(window:resize)": "onResize($event)"
  }
})
export class RegionFormViewComponent implements OnInit {

  public _environment = environment ;
  invalid :any = {} ;
  entityToEdit : any = { id:""};
  entityTo : any = { id:""};



  @ViewChild("triggerErrorModal") triggerErrorModal: ElementRef<HTMLElement>;
  @ViewChild("triggerLoadingModal") triggerLoadingModal: ElementRef<HTMLElement>;
  @ViewChild("triggerLoadingModalHide") triggerLoadingModalHide: ElementRef<HTMLElement>;
  @ViewChild("errorAlert") errorAlert: ElementRef<HTMLElement>;
  @ViewChild("successAlert") successAlert: ElementRef<HTMLElement>;

  loadingProcess: boolean = false;

  errors = {
    title: "",
    message: ""
  };

  success = {
    title: "",
    message: ""
  };

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
    bindOnePageNavigationEventsAutomatic("one-page-navigation") ;
  }

  back(){
    this._location.back();
  }

  update(){
    let toSent = { id : this.entityToEdit.id } ;
    let httpParams = this.utilsService.objectToHttpParamsNotEmpty( toSent  );
    this.routeNav.navigate(["test-formEdit"], { fragment: httpParams.toString() });
  }
  delete(){

  }


  // ngAfterViewInit() {
  //   bindOnePageNavigationEventsAutomatic("one-page-navigation");
  // }

  // showLoadingAlertWhole() {
  //   let el: HTMLElement = this.triggerLoadingModal.nativeElement;
  //   el.click();
  // }


  // hideLoadingAlertWhole() {
  //   setTimeout(() => {
  //     let el: HTMLElement = this.triggerLoadingModalHide.nativeElement;
  //     el.click();
  //   }, 2000);
  // }

  // showErrorAlertWhole(title, message) {

  //   this.errors.title = title;
  //   this.errors.message = message;
  //   let el: HTMLElement = this.triggerErrorModal.nativeElement;
  //   el.click();
  //   setInterval(() => {
  //   }, 1000);
  // }

  // showErrorAlert(title, message) {
  //   this.errors.title = title;
  //   this.errors.message = message;

  //   let el: HTMLElement = this.errorAlert.nativeElement;
  //   el.classList.remove("hide");
  //   el.classList.add("show");

  //   setTimeout(() => {
  //     el.classList.remove("show");
  //     el.classList.add("hide");
  //   }, this._environment.alertDelay);

  // }

  // /**
  // *
  // */
  // showSuccesAlert(title, message) {
  //   this.success.title = title;
  //   this.success.message = message;

  //   let el: HTMLElement = this.successAlert.nativeElement;
  //   el.classList.remove("hide");
  //   el.classList.add("show");

  //   setTimeout(() => {
  //     el.classList.remove("show");
  //     el.classList.add("hide");
  //   }, this._environment.alertDelay);

  // }

  // /**
  // *
  // */
  // handlerEditionSuccess(title, message) {
  //   //hide progress bar
  //   this.loadingProcess = false;

  //   this.showSuccesAlert(title, message);
  // }

  // /**
  // *
  // */
  // handlerEditionError(title, message) {
  //   //hide progress bar
  //   this.loadingProcess = false;

  //   this.showErrorAlert(title, message);
  // }

  // /**
  // *
  // */
  // refresh() {
  //   this.dataTableRef.load();
  // }
  // /**
  // *
  // */
  // update(entity: { id: any; }) {
  //   let toSent = { id: entity.id };
  //   let httpParams = this.utilsService.objectToHttpParamsNotEmpty(toSent);
  //   this.routeNav.navigate(["test-formEdit"], { fragment: httpParams.toString() });
  // }
  // /**
  // *
  // */
  // openDelete(entity) {
  //   this.entityToDelete = entity;
  // }

  // /**
  // *
  // */
  // delete() {

  //   this.invalid = {};
  //   this.loadingProcess = true;

  //   //make edit request from the service
  //   this.regionService.delete(this.entityToDelete["id"]).subscribe(
  //     response => {
  //       this.loadingProcess = false;
  //       //call the success handler
  //       this.handlerEditionSuccess("Confirmation de suppréssion", "L'élément a bien été supprimé!");
  //     },
  //     error => {

  //       this.loadingProcess = false;
  //       var title = (error.error.title != "") ? error.error.title : "Erreur de suppréssion";
  //       var message = (error.error.message != "") ? error.error.message : "Veuillez vérifier les champs!";

  //       //call the error handler
  //       this.handlerEditionError(error.error.title, error.error.message);
  //       this.invalid = error.error.errors;

  //     });
  // }

  // /**
  //  *
  //  */
  // back() {
  //   this._location.back();
  // }

}


