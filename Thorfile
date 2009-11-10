#
#
#

$:.unshift( "lib" )

require 'ream/sources/fs'

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

  no_tasks do
    def file_source( dir, mask )
      Ream::Sources::FS.new( dir, mask )
    end

    def load_template_processors
      Dir[ File.join( PROCESSORS_DIR ), "*.rb" ].each do |filename|
        require filename unless File.directory?( filename )
      end
    end
  end

  desc "build", "Build blog output"
  def build
    load_template_processors

    templates_source = file_source( TEMPLATES_DIR, "**/*.tpl" )
    pages_source = file_source( BLOG_DIR, "*.txt" )

    templates_source.each do |k, v|
      puts "#{k} -> #{v}"
    end
  end
end
