#===============================================================
# Processor: Haml
#   Created: 2009.11.12
#
#     Brief: Transform haml -> html
#===============================================================

require 'haml'

module TemplateProcessor
  class Haml < Ream::Blog::TemplateProcessor
    def self.process( value )
      begin
        ::Haml::Engine.new( value, :ugly => true ).render
      rescue Exception => e
        puts "[ERROR] #{e.message}"
        puts e.backtrace.map{|s|" * #{s}"} * $/

        e.message
      end
    end
  end
end
