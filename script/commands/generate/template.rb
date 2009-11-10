#===============================================================
# Generator: Template
#   Created: 2009.11.09
#
#     Brief: Create design template
#===============================================================

require File.join( File.dirname( __FILE__ ), "generator/utils" )

=begin
--- template:content
~--- template:name.1
~--- template:name.2
~---
---
=end

class Template
  include Utils

  BASE_DIR = "config/templates/"

  def initialize( args )
    @args = args
    @name = @args.first
  end

  def perform
    tpl = Ream::Template.scan
    new_file( "#{BASE_DIR}#{@name}.tpl" ) do |f|
      f.write( tpl[ "template:content" ] )
    end
  end
end

Template.new( ARGV ).perform
