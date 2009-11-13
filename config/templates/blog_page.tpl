--- yaml:environment
stylesheets: [blueprint/screen, custom/screen]
--- haml:html.content
.container
  .header
  .middle_part
    .content_here
      \%content%
    .side_bar
  .footer
---
