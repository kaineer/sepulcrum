#===============================================================
#    Module: Generator
#   Created: 2009.11.10
#
#     Brief: Is used from generators for generic operations
#===============================================================

$:.unshift( "lib" )

require 'fileutils'
require 'ream/template'

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

  # String operations
  #
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

  def timestamp
    Time.now.strftime( "%Y.%m.%d" )
  end
end
