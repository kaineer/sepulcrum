#===============================================================
# Generator: Processor
#   Created: 2009.11.09
#
#     Brief: Creating template processorc
#===============================================================

require File.join( File.dirname( __FILE__ ), "generator/utils" )

=begin
--- processor:class
{generator:header}

module TemplateProcessor
  class %class_name% < Ream::Blog::TemplateProcessor
    def self.process( value )
      begin
~        # TODO: process value somehow
      rescue Exception => e
        puts "[ERROR] #{e.message}"
        puts e.backtrace.map{|s|" * #{s}"} * $/

        e.message
      end
    end
  end
end
---
=end

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
      'creation_date' => self.timestamp
    }
  end
end

Processor.new( ARGV ).perform
