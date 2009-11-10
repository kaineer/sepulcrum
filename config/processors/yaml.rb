#===============================================================
# Generator: Yaml
#   Created: 2009.11.10
#
#     Brief: Get yaml data from text
#===============================================================

require 'yaml'

class Yaml < Ream::Blog::TemplateProcessor
  def process( value )
    begin
      YAML.load( value )
    rescue Exception => e
      puts "[ERROR] #{e.message}"
      puts e.backtrace.map{|s|"  * #{s}"} * $/

      e.message
    end
  end
end
