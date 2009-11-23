# blog pages to content
#
- map:
    dir: site/%p
    file: %n.html
  templates: [ empty ]
  sources: [ blog.source ]

# blog index
#
- map:
    dir: site/%p
    file: %n.html
  templates: [ index, sidebar ]
  sources: [ index.source ]

# json list
#
- map:
    dir: site/%p
    file: %n.json
  templates: [ json ]
  sources: [ list.source ]
