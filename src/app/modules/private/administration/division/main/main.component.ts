import { Component, OnInit } from '@angular/core';
import { MdbModalRef, MdbModalService } from 'mdb-angular-ui-kit/modal';
import { AjouterComponent } from '../ajouter/ajouter.component';

@Component({
  selector: 'app-main',
  templateUrl: './main.component.html',
  styleUrls: ['./main.component.css']
})
export class MainComponent implements OnInit {
  
  modalRef: MdbModalRef<AjouterComponent> | null = null;
  constructor(
    private modalService: MdbModalService,

  ) { }

  ngOnInit(): void {
  }


  add(){
    this.modalRef = this.modalService.open(AjouterComponent, {
      modalClass: 'modal-lg'
    })
}  

}
