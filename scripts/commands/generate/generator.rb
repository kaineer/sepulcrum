#===============================================================
# Generator: Generator
#   Created: 2009.11.09
#
#     Brief: Is used to create another generator
#===============================================================

require File.join( File.dirname( __FILE__ ), "generator/utils" )

=begin
--- generator:file
{generator:header}

require File.join( File.dirname( __FILE__ ), "generator/utils" )

{generator:templates}

{generator:class}

%class_name%.new( ARGV ).perform
--- generator:header
~#===============================================================
~# Generator: %class_name%
~#   Created: %creation_date%
~#
~#     Brief: TODO
~#===============================================================
--- generator:templates
~=begin
~--- template:name.1
~--- template:name.2
~---
~=end
--- generator:class
class %class_name%
{generator:content}
end
--- generator:content

{include:utils}

{method:initialize}

{method:perform}
--- include:utils
  include Utils
--- method:initialize
  def initialize( args )
    @args = args
  end
--- method:perform
  def perform
~    # TODO: all actions with args
  end
---
=end

class Generator
  include Utils

  def initialize( args )
    @args = args
    @name = args.first
  end

  def perform
    tpl = Ream::Template.scan
    new_file( "scripts/commands/generate/#{@name}.rb" ) do |f|
      f.write( tpl[ 'generator:file', params ] )
    end
  end

  protected

  def params
    params = {
      "class_name" => class_name,
      "creation_date" => Time.now.strftime( "%Y.%m.%d" )
    }
  end
end

Generator.new( ARGV ).perform
