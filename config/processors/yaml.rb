#===============================================================
# Generator: Yaml
#   Created: 2009.11.12
#
#     Brief: TODO
#===============================================================

require 'yaml'

module TemplateProcessor
  class Yaml < Ream::Blog::TemplateProcessor
    def self.process( value )
      begin
        ::YAML.load( value )
      rescue Exception => e
        puts "[ERROR] #{e.message}"
        puts e.backtrace.map{|s|" * #{s}"} * $/

        e.message
      end
    end
  end
end
