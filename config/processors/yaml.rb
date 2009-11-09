# TemplateProcessor sample
# 2009.11.09

require 'yaml'

class Yaml < Ream::Blog::TemplateProcessor
  def process( value )
    YAML.load( value )
  end
end
