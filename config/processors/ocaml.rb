#===============================================================
# Generator: Ocaml
#   Created: 2009.11.19
#
#     Brief: TODO
#===============================================================

require 'uv'

module TemplateProcessor
  class Ocaml < Ream::Blog::TemplateProcessor
    def self.process( value )
      begin
        Uv.parse( value, "xhtml", "ocaml", false, "active4d" )
      rescue Exception => e
        puts "[ERROR] #{e.message}"
        puts e.backtrace.map{|s|" * #{s}"} * $/

        e.message
      end
    end
  end
end
