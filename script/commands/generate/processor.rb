#===============================================================
# Generator: Processor
#   Created: 2009.11.09
#
#     Brief: Creating template processorc
#===============================================================

=begin
--- processor:class
{generator:header}

class %class_name% < Ream::Blog::TemplateProcessor
  def process( value )
~    # TODO: process value somehow
  end
end
---
=end

$REQUIRE = true
require File.join( File.dirname( __FILE__ ), "generator" )
$REQUIRE = nil
require 'ream/template'
require 'fileutils'

class Processor
  include Utils

  BASE_DIR = "config/processors"

  def initialize( args )
    @name = args.first
    @args = args
  end

  def perform
    tpl = Ream::Template.scan( __FILE__, File.join( File.dirname( __FILE__ ), "generator.rb" ) )
    new_file( File.join( BASE_DIR, "#{@name}.rb" ) ) do |f|
      f.write( tpl[ 'processor:class', params ] )
    end
  end

protected

  def params
    { 'class_name' => class_name,
      'creation_date' => Time.now.strftime( '%Y.%m.%d' )
    }
  end
end

Processor.new( ARGV ).perform
