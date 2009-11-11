#===============================================================
# Generator: Haml
#   Created: 2009.11.10
#
#     Brief: Haml text into html
#===============================================================

=begin
# Sure it is compatible with my templates
#
--- example:param.placeholder in tag
%tag %placeholder%
--- example:param.placeholder in text
# Whoops, a quirk way :-/
%tag
  ="%placeholder% more text"
--- example:template.placeholder
%tag
  {template.name}
---
=end

require 'haml'

module TP
class Haml < Ream::Blog::TemplateProcessor
  def self.process( value )
    begin
      ::Haml::Engine.new( value ).render
    rescue Exception => e
      puts "[ERROR] #{e.message}"
      puts e.backtrace.map{|s|"  * #{s}"} * $/

      e.message
    end
  end
end
end
