
function  bindOnePageNavigationEventsAutomatic( container )
{
   var childrenIds = [] ;

  $("#" + container ).find('.one-page-navigation-triggers-trigger').each(function(index,val){

        id = $( this ).attr("id") ;

        title = $( this ).html() ;

        childrenIds.push( { "id" : id , "title" : title } ) ;

  });

   bindOnePageNavigationEvents( container  , childrenIds ) ;
}
function  bindOnePageNavigationEvents( container  , childrenIds )
{
      $("#" + container ).find('.one-page-navigation-triggers-trigger').click(function(e){
      $("#" + container ).find('.one-page-navigation-triggers-trigger').removeClass('active') ;
      $( this ).addClass('active') ;
      id = $( this ).attr("id") ;
      //id = id.substring( 0 , id.length - 7) ;
      id = id + '-content' ;

      $("#" + container ).unbind( "scroll" );



      $("#" + container ).animate({
        scrollTop : 0
      }, 10, "swing", function(){

        $("#" + container ).animate({
          scrollTop: $( "#" + id ).position().top
        }, 10, "swing", function() {

            setTimeout(function(){

                $("#" + container ).bind("scroll",function(e){
                  bodyTop = $("#" + container ).position();
                  bodyTop = bodyTop.top  ;

                  //closestDiv = searchMostClosedChildrenOnePageNavigation( bodyTop )  ;
                  closestDiv = searchMostClosedChildrenOnePageNavigation( bodyTop , childrenIds[0]["id"] , childrenIds ) ;
                  if( closestDiv != "" )
                  {
                    $("#" + container ).find('.one-page-navigation-triggers-trigger').removeClass("active") ;
                    $("#" + container ).find("#"+closestDiv).addClass("active") ;
                  }
                });

            } , 1000);

        } );
      });
    });

    $("#"+container).find('.one-page-navigation-triggers-trigger').click(function(e){
      $("#"+container).find('.one-page-navigation-triggers-trigger').removeClass('active') ;
      $( this ).addClass('active') ;
    });

    $("#" + container ).bind("scroll",function(e){
      bodyTop = $("#" + container ).position();
      bodyTop = bodyTop.top  ;
      //closestDiv = searchMostClosedChildrenOnePageNavigation( bodyTop )  ;
      closestDiv = searchMostClosedChildrenOnePageNavigation( bodyTop , childrenIds[0]["id"] , childrenIds ) ;
      if( closestDiv != "" )
      {
        $("#" + container ).find('.one-page-navigation-triggers-trigger').removeClass("active") ;
        $("#" + container ).find("#"+closestDiv).addClass("active") ;
      }
    });
}

function searchMostClosedChildrenOnePageNavigation( bodyTop , closestChildrenDefaultId , childrenIds )
{
  last = bodyTop ;

  closestDiv =  closestChildrenDefaultId  ;

  $.each( childrenIds , function(index,val){

      var mTop = $( "#" + val["id"] + '-content' ).offset() ;

       mTop = mTop.top ;

      if( bodyTop - mTop > last   )
      {
        last = mTop - bodyTop ;
        closestDiv = val["id"] ;
      }
  });
  return  closestDiv ;

}

function createOnePageNavigationTriggers(children)
{
  entries = '' ;
  $.each( children , function( index , element ) {
    active = ( index == 0 ) ? 'active' : '' ;
    entries +=
    '<div  class="one-page-navigation-triggers-trigger ' + active + ' "  style="" id="' + element["id"] + '"   >' +
           element["name"] +
    '</div>' ;
  }) ;

  navMenu =
      '<div class="one-page-navigation-triggers" style=""  >' +
        entries +
      '</div>' ;

  return navMenu ;
}
