import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Admin } from './model';

@Injectable({
  providedIn: 'root'
})
export class AdministrationService {

url='http://localhost:3000/test';
admin:any

  constructor(
    private http: HttpClient,

  ) { }

  add(admin : Admin){
    return this.http.post<any>(this.url,admin);
  }

  get(){
    return this.http.get(this.url);
  }

  update(id:any, data: any){
    return this.http.put(this.url+'/'+id, data);
  }

  delete(id:any){
    return this.http.delete(this.url+'/'+id);
  }

}
