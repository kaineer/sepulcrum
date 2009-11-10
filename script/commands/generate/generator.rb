#===============================================================
# Generator: Generator
#   Created: 2009.11.09
#
#     Brief: Is used to create another generator
#===============================================================

require 'ream/template'
require 'fileutils'

=begin
--- generator:file
{generator:header}

{generator:templates}

$REQUIRE = true
require File.join( File.dirname( __FILE__ ), "generator" )
$REQUIRE = nil
require 'ream/template'
require 'fileutils'

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

module Utils
protected
  def debug( msg, &block )
    if verbose
      if block_given?
        print "[DEBUG] #{msg}.."
        begin
          block.call
        rescue Exception => e
          puts "failed!"
          puts "[ERROR] e.message"
          puts e.backtrace * $/
        else
          puts "ok."
        end
      else
        puts "[DEBUG] #{msg}"
      end
    else
      block.call if block_given?
    end
  end

  def warning( msg )
    puts "[WARN ] #{msg}"
  end

  # Flags
  #
  def verbose
    @args.include?( "--verbose" )
  end
  
  def force
    @args.include?( "--force" )
  end


  # Disk operations
  #
  def new_file( name, &block )
    if !File.exist?( name ) || force
      dir = File.dirname( name )
      create_dir( dir )
      debug( "#{name} creating" ) {||
        f = File.new( name, "w" )
        block.call( f )
        f.close
      }
    else
      warning( "#{name} already exist. Try to remove manually, or use `--force' option" )
    end
  end

  def create_dir( dir )
    if File.exist?( dir )
      debug( "#{dir} - directory exist." )
    else
      debug( "#{dir} - creating directory" ) {||
        FileUtils.mkdir_p( dir )
      }
    end
  end

  def capitalize( string )
    string.split( "_" ).map{|s|
      s[0, 1].upcase + s[1..-1].downcase
    } * ""
  end

  def class_name
    @name.split( /[\\\/]/ ).map{|s|
      capitalize( s )
    } * "::"
  end
end

unless $REQUIRE
  class Generator
    include Utils

    def initialize( args )
      @args = args
      @name = args.first
    end

    def perform
      tpl = Ream::Template.scan
      new_file( "script/commands/generate/#{@name}.rb" ) do |f|
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
end
