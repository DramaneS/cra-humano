import { AwkaaDataTableSort } from "src/app/modules/custom/awkaa-dataTable-sort";

export interface AwkaaDataTableConfig {
    id  : string ;
    title  : string ;

    displayHeader ? : boolean ;
    displayFooter ? : boolean ;

    displaySorter ? : boolean ;
    displayFilterTrigger ? : boolean ;
    displayTemplateSwitch ? : boolean ;

    displayPaginator ? : boolean ;
    displayPaginatorRecapHeader ? : boolean ;
    displayPaginatorRecapFooter ? : boolean ;

    displayPaginatorPageChooser ? : boolean ;
    displayPaginatorPageSizeChooser ? : boolean ;


    filterTriggerTargetId ? : string ;

    sorters ? : AwkaaDataTableSort []  ;
    templateSwitches ? : string []  ;
    paginatorPageSizeChoices ? : number []


    templateSwitch ? : string  ;
    sorter ? : AwkaaDataTableSort  ;
    paginatorPageSize ? : number  ;
    paginatorPage ? : number  ;


    urlParamSorter ? : any ;
    urlParamTemplateSwitch ?: any ;
    urlParamPaginatorPageSize ?: any ;
    urlParamPaginatorPage ? : any ;
    urlParamFormData ? : string [];

    displayedColumns ? : string[];
    data ? : any[];

    dataItemTotal ? : number  ;
    dataItemFirstRank ? : number  ;
    dataItemLastRank ? : number  ;
    dataItemPageTotal ? : number  ;

    url ? : string ;
    urlHeader ?: object ;

    urlMethod ? : string ;

    dataResponseProp  ? : string ;
    dataItemTotalResponseProp ? : string ;
    dataItemPageTotalResponseProp ? : string ;

    dataItemTotalContainerResponseProp ? : string ;
    dataItemPageTotalContainerResponseProp ? : string ;

/*
    {{dataItemFirstRank}} à {{dataItemLastRank}} / {{dataItemTotal}} Résultat{{ ( dataItemTotal > 1 ) ? 's': ''}}


    dataItemTotal ? : number  ;
    dataItemFirstRank ? : number  ;
    dataItemLastRank ? : number  ;

    */

 }
