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
    %link{:rel=>'stylesheet', :href=>'/stylesheets/hierarchy.css', :type=>'text/css'}

    %script{:src=>'/javascripts/jquery.js'}
    %script{:src=>'/javascripts/jquery.ream.utils.js'}
    %script{:src=>'/javascripts/sepulcrum.js'}

  %body
    .container
      .header.span-24.last
      .span-24.last
        .span-18.top-bottom-margin#content
        .span-6.last.top-bottom-margin.sidebar
          .last.frame
            \{about:me}
      .span-24.footer.last
        .frame
          %h2 Слон полосатый, большой..
          %p Покупайте наших слонов!
---
