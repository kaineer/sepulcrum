#===============================================================
# Generator: Script
#   Created: 2009.11.11
#
#     Brief: TODO
#===============================================================

require File.join( File.dirname( __FILE__ ), "generator/utils" )

=begin
--- script:content
~#!/usr/bin/ruby

basedir = Dir.pwd

~### TODO: Some actions to do
---
=end

class Script
  include Utils

  BASE_DIR = "script/"

  def initialize( args )
    @args = args
    @name = args.first
  end

  def perform
    filename = File.join( BASE_DIR, @name ) 
    new_file( filename ) do |f|
      tpl = Ream::Template.scan( __FILE__ )
      f.write( tpl[ 'script:content' ] )
    end

    FileUtils::chmod( 0755, filename )
  end
end

Script.new( ARGV ).perform
