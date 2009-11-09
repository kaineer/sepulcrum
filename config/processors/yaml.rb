# TemplateProcessor sample

require 'yaml'

class Yaml < Ream::Blog::TemplateProcessor
  def process( value )
    YAML.load( value )
  end
end
