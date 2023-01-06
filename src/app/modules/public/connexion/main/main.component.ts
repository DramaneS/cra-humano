import { Component,   OnInit, Renderer2  , OnDestroy , ViewChild, ElementRef  , EventEmitter, Input, Output } from '@angular/core';
import { environment } from "src/environments/environment";
import { ActivatedRoute , Router } from '@angular/router';
import { ResetPasswordComponent } from '../reset-password/reset-password.component';
import { MdbModalRef, MdbModalService } from 'mdb-angular-ui-kit/modal';


@Component({
  selector: 'app-public-connnexion',
  templateUrl: './main.component.html',
  styleUrls: ['./main.component.css'],
  host: {
   '(window:resize)': 'onResize($event)'
  }
})
export class MainComponent implements OnInit {

  modalRef: MdbModalRef<ResetPasswordComponent> | null = null;

  public inscrit =0;
  public _environment = environment ;
  public year = new Date().getFullYear();

  constructor(
    private renderer: Renderer2,
    private elementRef: ElementRef ,
    private route: ActivatedRoute,
    private routeNav : Router,
    private modalService: MdbModalService
    
  ) {
  }

  ngOnInit(): void {
  }

  ngAfterViewInit() {
  }


ins(){
  if (this.inscrit==0){
    this.inscrit=1
  }else{
    this.inscrit=0
  }
}


resetpassword(){
    this.modalRef = this.modalService.open(ResetPasswordComponent, {
      modalClass: 'modal-xl'
    })
}

}

