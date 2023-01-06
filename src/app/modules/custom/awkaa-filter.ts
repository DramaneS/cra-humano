
export interface AwkaaFilter {
    id  : string ;
    title  : string ;
    name ? : string ;
    label ?  : string ;


    dataSourceProvide ?  : string ;

    dataSource ? : any [];
    dataSourceUrl ? : string ;
    dataSourceUrlResponseProp ? : string ;

    urlParam ? : string ;
    urlParamSwitch ? : string ;
    urlParamMin ? : string ;
    urlParamMax ? : string ;

    value  ? : any ;
    valueDefault ? : any ;
    valueFormatted ? : any ;


    valueMin  ? :  any ;
    valueMinDefault ? : any ;
    valueMinFormatted ? : any ;


    valueMax  ? :  any ;
    valueMaxDefault ? : any ;
    valueMaxFormatted ? : any ;

    optionId ? : string ;
    optionName ? : string ;


    floor ? : number ;
    ceil ? : number ;


 }
