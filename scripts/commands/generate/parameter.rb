#===============================================================
# Generator: Parameter
#   Created: 2009.11.17
#
#     Brief: TODO
#===============================================================

require File.join( File.dirname( __FILE__ ), "generator/utils" )

=begin
--- parameter:class
module TemplateParameter
  class %class_name%
    RE_YOUR_REGEXP = # some regexp

    def self.matches?( parameter_name )
      RE_YOUR_REGEXP === parameter_name
    end

    def initialize( parameter_name )
      # do something with parameter_name
    end

    def value
      # calculate and return value
    end
  end

  @@parameters ||= []
  @@parameters << %class_name%
end
---
=end

class Parameter
  include Utils

  BASE_DIR = "config/parameters"

  def initialize( args )
    @args = args
    @name = args.first
  end

  def perform
    tpl = Ream::Template.scan( __FILE__ )
    new_file( File.join( BASE_DIR, "#{@name}.rb" ) ) do |f|
      f.write( tpl[ 'parameter:class', params ] )
    end
  end

  def params
    { 'class_name' => class_name
    }
  end
end

Parameter.new( ARGV ).perform
