//
//
//

$( document ).ready( function() {
  align_sidebar();

  $.getJSON( "/list.json", function( data ) {
    $.each( data, function( i, elt ) {
      $('#content').tag('div', {class: 'span-18 last frame blog'}, function(t){
        var h2 = t.tag( 'h2', elt.title );
        h2.data( "filename", elt.filename );
        h2.data( "date", elt.date );
      } );

      align_sidebar();
    } );
  } );

  function align_sidebar() {
    var $content_height =$( '#content' ).height() - 14;
    var $hierarchy_height = $( '.sidebar .hierarchy' ).height();
    var $sidebar_height = 
      $content_height > $hierarchy_height ? $content_height : $hierarchy_height;

    $( '.sidebar .frame' ).
      css( 'height',
	   $sidebar_height
	 );
  }

  function hide_content() {
    $( ".blog.frame div" ).hide();
    $( ".blog.frame h2" ).data( "visible", false );
  }

  $( ".blog.frame h2" ).live( "click", function() {
    var h2 = $( this );

    if( !h2.data( "loaded" ) ) {
      h2.parent().addClass( "loading" );
      $.get( h2.data( "filename" ), function( data ) {
        h2.parent().removeClass( "loading" );
        if( !h2.data( "loaded" ) ) {
	  hide_content();

          h2.data( "loaded", true );
          h2.data( "visible", true );
          h2.data( "content", data );
          h2.parent().tag( "div" ).append( data );

          align_sidebar();
        }
      } );
    } else {
      var was_visible = h2.data( "visible" );
      hide_content();

      if( !was_visible ) {
        h2.data( "visible", true );
        h2.parent().find( "div" ).show();
      }

      align_sidebar();    

      return false;
    }

  } );

  function toggle_elipsis( elt, condition ) {
    if( condition ) {
      elt.tag( "span", " ..." );
    } else {
      elt.find( "span" ).remove();
    }
  }

  $( ".hierarchy .title" ).click( function() {
    var $container = $( this ).next( ".container" );

    toggle_elipsis( $( this ),
      $container && $container.length > 0 && 
    	$container.css( "display" ) != "none" );

    $container.toggle();

    align_sidebar();

    return false;
  } ).filter( function() { 
    return $( this ).next( ".container" ).length > 0; 
  } ).addClass( "expandable" );

  $( ".hierarchy > .title" ).click();
} );
