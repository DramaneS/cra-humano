import { AwkaaDataListSort } from "src/app/modules/custom/awkaa-dataList-sort";
import { AwkaaDataListTemplateSwitch } from "src/app/modules/custom/awkaa-dataList-templateSwitch";

export interface AwkaaDataListConfig {
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

    sorters ? : AwkaaDataListSort []  ;
    templateSwitches ? : string []  ;
    paginatorPageSizeChoices ? : number []


    templateSwitch ? : string  ;
    sorter ? : AwkaaDataListSort  ;
    paginatorPageSize ? : number  ;
    paginatorPage ? : number  ;


    urlParamSorter ? : any ;
    urlParamTemplateSwitch ?: any ;
    urlParamPaginatorPageSize ?: any ;
    urlParamPaginatorPage ? : any ;
    urlParamFormData ? : string [];

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
