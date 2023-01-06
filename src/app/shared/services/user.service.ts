// let headers = new HttpHeaders({'Content-Type': 'application/json'});
// let options = { headers : headers };
//  let body = {

//         "compagnie_name":this.compagnieName,
//         "address":this.address,
//         "region_id":this.region_id,
//         "business_region_ids":this.business_region_ids.join(","),
//         "supplier_division_ids":this.supplier_division_ids.join(","),
//         "website":this.website,
//         "division_id":this.division_id,
//         "firstname":this.firstname,
//         "lastname":this.lastname,
//         "email":this.email,
//         "phone_no":this.phone_no,
//         "office_phone_no":this.office_phone_no,
//         "role_id":this.role_id
//       };

//       this.loadingRegister = true ;

// this.http.post(this.utilsService.backendUrl + "/user/registration-request" , body ,options ).subscribe( res => {






// this.http.get(this.utilsService.backendUrl + "/region?per_page=100000").subscribe( res => {
//       let mregions = res["regions"]  as any[] ;
//       let regionss : any [] = [] ;





// this.http.get(this.utilsService.backendUrl + "/divisions-without-subdivisions?per_page=100000").subscribe( res => {
//       let mdivisionsFournisseur = res["divisions"]  as any[] ;
//       let divisionssFournisseur : any [] = [] ;


//   let retour = this.http.post( this.utilsService.backendUrl + "/login" ,  { "email" : email , "password" : password } ) ;


// let body = {

//           "username":this.resetEmail,

//         };


//   this.http.post(this.utilsService.backendUrl + "/user/forgot-password" , body ,options ).subscribe( res => {






//     let headers = new HttpHeaders({'Content-Type': 'application/json'});
//     let options = { headers : headers };

//     let body = {
//       //"old_password" : this.old_password ,
//       "new_password" : this.new_password ,
//       "is_a_new_user" : 1 ,

//       "password_confirmation" : this.password_confirmation
//     } ;
//     this.loadingPassword =true ;
//     this.http.put(this.utilsService.backendUrl + "/user/create-password/"+ this.token , body , options ).subscribe( res => {






//             let headers = new HttpHeaders({'Content-Type': 'application/json'});
//             let options = { headers : headers };

//             let body = {
//               //"old_password" : this.old_password ,
//               "new_password" : this.new_password ,
//               "is_a_new_user" : 0 ,

//               "password_confirmation" : this.password_confirmation
//             } ;
//             this.loadingPassword =true ;
//             this.http.put(this.utilsService.backendUrl + "/user/create-password/"+ this.token , body , options ).subscribe( res => {
