import { Component, ElementRef, ViewChild } from '@angular/core';
import { ActivatedRoute , Router ,RouterEvent ,NavigationStart,NavigationEnd,NavigationCancel,NavigationError,Event } from '@angular/router';
import { filter } from 'rxjs/operators';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent {

  //insert
  @ViewChild('triggerLoadingModal') triggerLoadingModal : ElementRef<HTMLElement>;
  @ViewChild('triggerLoadingModalHide') triggerLoadingModalHide : ElementRef<HTMLElement>;

  title = 'humano';

  public isSpinner = true;

  ngOnInit(): void {

  }

  ngAfterViewInit() {

  }

  constructor(private router: Router) {
      router.events.pipe(
        filter(event => event instanceof  NavigationStart ) ).subscribe((event) => {
          //this.isSpinner = true;
          console.log(event);
          this.showLoadingAlertWhole();
      });
      router.events.pipe(
        filter(event => event instanceof NavigationEnd ) ).subscribe((event) => {
          setTimeout(() => {
            console.log(event);

            //this.isSpinner = false;
            this.hideLoadingAlertWhole();
          },1000);
      });
  }
  showLoadingAlertWhole()
  {
      let el : HTMLElement = this.triggerLoadingModal.nativeElement;
      el.click();
  }

  hideLoadingAlertWhole()
  {
      let el : HTMLElement = this.triggerLoadingModalHide.nativeElement;
        el.click();
  }


    // router.events.pipe(
    //   filter(event => event instanceof NavigationEnd) ).
    //   subscribe((event) => {
    //     this.isSpinner = true;

    //     console.log(event);

    // });

    // router.events.pipe(
    //   filter(event => event instanceof NavigationStart) ).
    //   subscribe((event) => {

    //     setTimeout(() => {
    //       this.isSpinner = false;
    //     },1000);
    //     console.log(event);

    // });

    /*
    router.events.subscribe((e ) => {
      if (event instanceof NavigationStart) {
        this.isSpinner = true;
        alert('start');
      }
      if (event instanceof NavigationEnd) {
        this.isSpinner = false;
        alert('end');
      }
      // Set loading state to false in both of the below events to hide the spinner in case a request fails
      if (event instanceof NavigationCancel) {
        this.isSpinner = false ;
        alert('cancel');
      }
      if (event instanceof NavigationError) {
        this.isSpinner = false ;
        alert('error');
      }
      console.log(event);
    });*/
/*

    //on fragment change event
    this.router.events.subscribe((val) => {

      //check fragment change finish
      if( val instanceof NavigationStart )
      {
        //get the url and split from fragment caracter
        let parts = val['url'].split('#') ;
        //get the fragment if present
        let fragment_ = (parts.length >1 ) ? parts[1] : "";
        //set the state of form with fragmant para,s
        this.setStateFromUrl(fragment_);

      }
    });
    */
  }

