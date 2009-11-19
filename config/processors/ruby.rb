#===============================================================
# Generator: Ruby
#   Created: 2009.11.19
#
#     Brief: Takes ruby code and returns highlited html
#===============================================================

require 'uv'

module TemplateProcessor
  class Ruby < Ream::Blog::TemplateProcessor
    def self.process( value )
      begin
        Uv.parse( value, "xhtml", "ruby", false, "active4d" )
      rescue Exception => e
        puts "[ERROR] #{e.message}"
        puts e.backtrace.map{|s|" * #{s}"} * $/

        e.message
      end
    end
  end
end
