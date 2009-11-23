require 'ream/blog/template_processor'
require 'ream/blog/overrides/string'
require 'ream/template'

module Ream
  module Blog
    module TemplateParameter
      class JsonFileList
        def self.matches?( parameter_name )
          parameter_name == "json.file.list"
        end

        def initialize( parameter_name ); end

        def list_item( filename, template )
          params = template[ "parameters" ]

          "    { filename: \"#{filename.path.map( '/%p/%n.html' )}\", " \
          "date: \"#{params['date'].to_s}\", " \
          "title: \"#{params['title'].to_s}\" }"
        end

        def value
          files = nil
          templates = {}

          Dir.chdir( "pages" ) do
            files = Dir[ "blog/*.txt" ].sort.reverse
            files.each do |fn|
              templates[ fn ] = Ream::Template.scan( fn ).
                with( Ream::Blog::TemplateProcessor ) 
            end
          end

          files.map{|s|
            list_item( s, templates[ s ] )
          } * ",#{$/}"
        end
      end

      @@parameters ||= []
      @@parameters << JsonFileList
    end
  end
end
