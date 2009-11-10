#===============================================================
# Generator: BlogPage
#   Created: 2009.11.10
#
#     Brief: TODO
#===============================================================

require File.join( File.dirname( __FILE__ ), "generator/utils" )

=begin
--- blog:page
~--- page:environment
title: %name%
date: %creation_date%
tags: ### TODO: place your tags here
templates: [blog_page]
~--- page:content
~### TODO: Place your content here
~---
---
=end

class BlogPage
  include Utils

  BASE_DIR = "pages/blog"

  def initialize( args )
    @args = args
    @name = args.first
  end

  def perform
    new_file( File.join( BASE_DIR, filename + ".txt" ) ) do |f|
      tpl = Ream::Template.scan
      f.write( tpl[ "blog:page", params ] )
    end

    # TODO: all actions with args
  end

protected

  def get_prefix
    result = 0
    Dir.chdir( BASE_DIR ) do
      max_index = Dir[ "*" ].map{|s|s[/^(\d+)/, 1].to_i}.max
      result = max_index + 1 if max_index
    end
    "%03d" % result
  end

  def filename
    [ get_prefix, @name.downcase.gsub( /[^a-z]+/, '-' ) ] * "-"
  end

  def params
    { "name" => @name,
      "creation_date" => self.timestamp
    }
  end
end

BlogPage.new( ARGV ).perform
