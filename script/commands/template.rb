#===============================================================
# Generator: Template
#   Created: 2009.11.09
#
#     Brief: Create design template
#===============================================================

=begin
--- template:content
~--- template:name.1
~--- template:name.2
~---
---
=end

$REQUIRE = true
require File.join( File.dirname( __FILE__ ), "generator" )
$REQUIRE = nil

require 'ream/template'
require 'fileutils'

class Template
  include Utils

  def initialize( args )
    @args = args
    @name = @args.first
  end

  def perform
    tpl = Ream::Template.scan
    new_file( "templates/#{@name}.tpl" ) do |f|
      f.write( tpl[ "template:content" ] )
    end
  end
end

Template.new( ARGV ).perform
