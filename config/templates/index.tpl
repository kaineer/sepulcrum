--- haml:html:page
!!!
%html{'xml:lang'=>'ru', :xmlns=>'http://www.w3.org/1999/xhtml', :lang=>'ru'}
  %head
    %title Kaineer.info
    %meta{'http-equiv'=>'Content-Type', :content=>'text/html;charset=UTF-8'}
    %meta{'http-equiv'=>'Content-Language', :content=>'ru'}

    %link{:rel=>'stylesheet', :href=>'/stylesheets/blueprint/screen.css', :type=>'text/css', :media=>'screen, projection'}
    %link{:rel=>'stylesheet', :href=>'/stylesheets/blueprint/print.css', :type=>'text/css', :media=>'print'}
    /[if lt IE 8]
      %link{:rel=>'stylesheet', :href=>'/stylesheets/blueprint/ie.css', :type=>'text/css', :media=>'screen/projection'}

    %link{:rel=>'stylesheet', :href=>'/stylesheets/screen.css', :type=>'text/css'}

    %script{:src=>'/javascripts/jquery.js'}
    %script{:src=>'/javascripts/jquery.ream.utils.js'}

    %script
      {page.jquery}

  %body
    .container
      .header.span-24.last
      .span-24.last
        .span-18.top-bottom-margin#content
        .span-6.last.top-bottom-margin.sidebar
          .last.frame
            %h2 О себе
            %pre
              \{about:me}
      .span-24.footer.last
        .frame
          %h2 Слон полосатый, большой..
          %p Покупайте наших слонов!
--- page.jquery
$( document ).ready( function() {
  $.getJSON( "/list.json", function( data ) {
    $.each( data, function( i, elt ) {
      $('#content').tag('div', {class: 'span-18 last frame blog'}, function(t){
	var h2 = t.tag( 'h2', elt.title );
	h2.data( "filename", elt.filename );
	h2.data( "date", elt.date );
      } );
    } );
  } );

  function align_sidebar() {
    $( '.sidebar .frame' ).css( 'height',
      $( '#content' ).height() - 14
    );
  }

  $( ".blog.frame h2" ).live( "click", function() {
    var h2 = $( this );

    if( !h2.data( "loaded" ) ) {
      h2.parent().addClass( "loading" );
      $.get( h2.data( "filename" ), function( data ) {
	h2.parent().removeClass( "loading" );
	if( !h2.data( "loaded" ) ) {
	  h2.data( "loaded", true );
	  h2.data( "visible", true );
	  h2.data( "content", data );
	  h2.parent().tag( "div" ).append( data );

	  align_sidebar();
	}
      } );
    } else {
      if( h2.data( "visible" ) ) {
	h2.data( "visible", false );
	h2.parent().find( "div" ).hide();
      } else {
	h2.data( "visible", true );
	h2.parent().find( "div" ).show();
      }

      align_sidebar();    
    }
  } );
} );
---
