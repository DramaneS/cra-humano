import { Component, OnInit } from '@angular/core';
import { MdbModalRef, MdbModalService } from 'mdb-angular-ui-kit/modal';
import { AdministrationService } from '../../administration.service';
import { AjouterComponent } from '../ajouter/ajouter.component';

@Component({
  selector: 'app-main',
  templateUrl: './main.component.html',
  styleUrls: ['./main.component.css']
})
export class MainComponent implements OnInit {

  modalRef: MdbModalRef<AjouterComponent> | null = null;
  admin: any;

  constructor(
    
    private modalService: MdbModalService,
    private service : AdministrationService

  ) { }

  ngOnInit(): void {
    this.get()
  }

  get() {
    return this.service.get().subscribe((data: any) => {
      this.admin = data;
      console.log(data);
      
    })
  }

  add(){
    this.modalRef = this.modalService.open(AjouterComponent, {
      modalClass: 'modal-lg'
    })
}
}
