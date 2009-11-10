#
#
#

$:.unshift( "lib" )

require 'ream/sources/fs'
require 'ream/blog/template_cache__'

module LogUtils
  RED       = "\e[31m"
  GREEN     = "\e[92m"
  YELLOW    = "\e[33m"
  DARK_GRAY = "\e[90m"
  BLUE      = "\e[34m"
  RESET     = "\e[0m"

  def log( level, message, color )
    puts "[%s%-5s%s] %s" % [ color, level.upcase, RESET, message ]
  end

  def error( message )
    log( "error", message, RED )
  end

  def debug( message )
    log( "debug", message, DARK_GRAY )
  end

  def warn( message )
    log( "warn", message, YELLOW )
  end

  def info( message )
    log( "info", message, BLUE )
  end
end

module FileUtils
  def list_dir( dir, mask = "**/*" )
    Dir.chdir( dir ) do
      puts Dir[ mask ].sort * $/
    end
  end

  def clean_dir( dir, mask = "**/*~" )
    Dir.chdir( dir ) do
      Dir[ mask ].each {|f| File.delete( f )}
    end
  end
end

class Setup < Thor
  no_tasks do
    def find_gem( gem_name )
      begin
        gem gem_name
        true
      rescue Gem::LoadError => e
        false
      end
    end

    def setup_gem( gem_name )
      unless find_gem( gem_name )
        info( "installing #{gem_name}" )
        system( "gem install #{gem_name}" ) 
      else
        debug( "#{gem_name} already installed" )
      end
    end
  end

  include LogUtils

  desc "links", "Links to external libs"
  def links
    unless File.exist?( "lib" )
      info( "creating link" )
      system( "ln -s ../ruby/ream/lib lib" )
    else
      debug( "link already created" )
    end
  end

  desc "gems", "Needed gems"
  def gems
    setup_gem( "haml" )
    # something more?
  end

  desc "all", "Do all setup"
  def all
    invoke :gems
    invoke :links
  end
end

class Pages < Thor
  BLOG_DIR = "pages/blog"
  include FileUtils

  desc "list", "Lists files in blog directory"
  def list
    list_dir( BLOG_DIR )
  end

  desc "clean", "Clean blog pages directory"
  def clean
    clean_dir( BLOG_DIR )
  end
end

class Blog < Thor
  BLOG_DIR = "pages/blog"
  TEMPLATES_DIR = "config/templates"
  PROCESSORS_DIR = "config/processors"

  include LogUtils

  no_tasks do
    def file_source( dir, mask )
      Ream::Sources::FS.new( dir, mask )
    end

    def load_template_processors
      info( "load_template_processors" )
      Dir[ File.join( PROCESSORS_DIR ), "*.rb" ].each do |filename|
        debug( "Filename: #{filename}" )
        require filename unless File.directory?( filename )
      end
    end
  end

  desc "build", "Build blog output"
  def build
    load_template_processors

    templates_source = file_source( TEMPLATES_DIR, "**/*.tpl" )
    pages_source = file_source( BLOG_DIR, "*.txt" )

    tc = Ream::Blog::TemplateCache.new( templates_source )
    info( tc.fetch( 'html.tpl', 'blog_page.tpl' )[ 'html:doctype' ] )
  end
end
