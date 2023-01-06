// This file can be replaced during build by using the `fileReplacements` array.
// `ng build` replaces `environment.ts` with `environment.prod.ts`.
// The list of file replacements can be found in `angular.json`.

export const environment = {
  production: false,
  apiUrl: 'http://localhost:8080',
  selfUrl : 'http://localhost:4221',
  user : {
    firstname:"Damiel  teri ded ",
    lastname:"Togo",
    logoLocalUrl : "../../../../assets/images/lg_user.jpeg",
  },
  app: {
    name : "HUMANO GROUP",
    logoLocalUrl : "../../../../assets/images/logo-humano-1.png",

    logoLocalInsigneUrl : "../../../../assets/images/logo-humano-insigne.png",

    facebook : "https://www.facebook.com/boiteainnovations",
    youtube : "https://www.youtube.com/channel/UCWSZsuj9o3jMUi81YOL2XTA",

    youtubeUrl : "../../../../assets/images/youtube.svg" ,
    facebookUrl : "../../../../assets/images/facebook.svg" ,
    defaultCard : "../../../../assets/images/card-default.jpeg",
    backgroundBlackOpacity : "../../../../assets/images/background-black-opacity.png"

  },



    fileDefaultUser : '/assets/images/icon-user.svg' ,
    fileDefaultRegistration : '/assets/images/image-register.png' ,
    fileDefaultRegistration2 : '/assets/images/image-register-2.png' ,

    fileDefaultRegistrationApprove : '/assets/images/image-register.png' ,

    fileDefaultPasswordReset : '/assets/images/password-reset.svg' ,
    fileDefaultPasswordResetInit : '/assets/images/password-reset-init.svg' ,


    fileGeneric : '/assets/images/file-generic.png' ,
    fileImage : '/assets/images/file-generic.png' ,

    fileAudio : '/assets/images/file-audio.png' ,
    fileVideo : '/assets/images/file-video.png' ,


    fileCompressed : '/assets/images/file-compressed.png' ,
    filePdf : '/assets/images/file-pdf.png' ,
    fileDocx : '/assets/images/file-docx.png' ,
    filePpt : '/assets/images/file-ppt.png' ,
    fileXls : '/assets/images/file-xls.png' ,
    fileSql : '/assets/images/file-sql.png' ,
    fileTxt : '/assets/images/file-txt.png' ,
    alertDelay: 5000,
    alertWholeDelay: 7000,

};

/*
 * For easier debugging in development mode, you can import the following file
 * to ignore zone related error stack frames such as `zone.run`, `zoneDelegate.invokeTask`.
 *
 * This import should be commented out in production mode because it will have a negative impact
 * on performance if an error is thrown.
 */
// import 'zone.js/plugins/zone-error';  // Included with Angular CLI.
