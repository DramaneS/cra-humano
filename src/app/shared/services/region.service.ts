
import { Injectable } from "@angular/core";
import { Observable, throwError } from "rxjs";
import { catchError } from "rxjs/operators";
import { HttpClient, HttpHeaders, HttpErrorResponse, HttpParams } from "@angular/common/http";

import { environment } from "src/environments/environment";
import { UtilsService } from "src/app/shared/services/utils.service";


@Injectable({
  providedIn: "root"
})
export class RegionService {

  controller = "regions";

  constructor(private http: HttpClient,
    private utilsService: UtilsService) {
  }


  //get all the entities
  getAll(): Observable<any> {
    return this.http.get(environment.apiUrl + "/" + this.controller);
  }

  //get the entity by id
  get(id): Observable<any> {
    return this.http.get(environment.apiUrl + "/" + this.controller + "/" + id);
  }

  //get the entity by ids
  getBulk(ids: string[]): Observable<any> {
    return this.http.get(environment.apiUrl + "/" + this.controller + "/bulk/" + ids.join(","));
  }

  //get the all the data need to edit a single entity
  getEditionData(id?): Observable<any> {

    if (typeof id !== "undefined") {

      return this.http.get(environment.apiUrl + "/" + this.controller + "/editionData");

    } else {

      return this.http.get(environment.apiUrl + "/" + this.controller + "/editionData/" + id);

    }

  }


  //search the entities witch match criterias , sorted and paginated
  search(filter, page, pageSize, multiSortMeta): Observable<any> {
    let params = "";
    let filters_converted = this.utilsService.parseFilterForSearch(filter);
    let sort_converted = this.utilsService.parseSortForSearch(multiSortMeta);

    params += (filters_converted.length > 0) ? "filter=" + JSON.stringify(filters_converted) : "";
    params += (sort_converted.length > 0) ? "&sort=" + JSON.stringify(sort_converted) : "";

    if (page != undefined) {
      params += "&page=" + (Math.floor(page / pageSize) + 1);
    }

    if (pageSize != undefined) {
      params += "&pageSize=" + pageSize;
    }

    return this.http.get(environment.apiUrl + "/" + this.controller + "/search?" + encodeURI(params));

  }

  //delete all entity
  deleteAll(): Observable<any> {
    return this.http.delete(environment.apiUrl + "/" + this.controller);
  }

  //delete an entity
  delete(id): Observable<any> {
    return this.http.delete(environment.apiUrl + "/" + this.controller + "/" + id);
  }

  //get the entity by ids
  deleteBulk(ids: string[]): Observable<any> {
    return this.http.delete(environment.apiUrl + "/" + this.controller + "/bulk/" + ids.join(","));
  }





  //create an entity
  create(data): Observable<any> {

    return this.http.post(environment.apiUrl + "/" + this.controller, data);
  }

  //update an entity
  update(data): Observable<any> {

    return this.http.put(environment.apiUrl + "/" + this.controller, data);
  }


  //bulk create  entities
  createBulk(data): Observable<any> {
    if (Array.isArray(data)) {
      Object.entries(data).forEach(([key, value]) => {

      });
    }
    return this.http.post(environment.apiUrl + "/" + this.controller + "/bulk", data);
  }

  //bulk update entities
  updateBulk(data): Observable<any> {
    if (Array.isArray(data)) {
      Object.entries(data).forEach(([key, value]) => {

      });
    }

    return this.http.put(environment.apiUrl + "/" + this.controller + "/bulk", data);

  }

  //edit the entity attribute id
  createWithMedia(name, filesMapIds, filesLinkedMapIds, files, filesLinked): Observable<any> {

    let formData = new FormData();

    //fill with data
    formData.append(
      "filesMapIds",
      new Blob([JSON.stringify(filesMapIds)], { type: "application/json" })
    );

    formData.append(
      "filesLinkedMapIds",
      new Blob([JSON.stringify(filesLinkedMapIds)], { type: "application/json" })
    );

    formData.append(
      "name",
      new Blob([JSON.stringify(name)], { type: "application/json" })
    );

    if (Array.isArray(files)) {
      //fetch files
      Object.entries(files).forEach(([key, file]) => {
        formData.append("files", file);
      });
    }

    if (Array.isArray(filesLinked)) {
      //fetch files
      Object.entries(filesLinked).forEach(([key, file]) => {
        formData.append("filesLinked", file);
      });
    }

    return this.http.post(environment.apiUrl + "/" + this.controller + "/createWithMedia",
      formData,
      {
        responseType: "json",
        observe: "events"
      }
    );

  }
}
