#===============================================================
# Generator: Hierarchy
#   Created: 2009.11.18
#
#     Brief: Gets yaml-hierarchy and gives divs
#===============================================================

module TemplateProcessor
  class Hierarchy < Ream::Blog::TemplateProcessor
    GLUE = $/

    def self.divs( doc )
      div( 'hierarchy' ) do
        divs0( doc )
      end
    end

    def self.div( name, &block )
      "<div class='#{name}'>" +
        block.call +
        "</div>"
    end

    def self.divs0( doc )
      doc.map do |elt|
        case elt
        when Hash then hash_div( elt )
        else raise "Should be hash"
        end
      end.join( GLUE )
    end

    def self.hash_div( elt )
      key = elt.keys.first
      
      div( "title" ) {|| key } +
        value_div( elt[ key ] )
    end

    def self.array_div( array )
      array.map{|s|div( 'value' ){|| s.to_s }}.join( GLUE )
    end

    def self.value_div( value )
      case value
      when String then div( 'value' ) {|| value }
      when Array
        if value.first.is_a?( Hash )
          div( 'container' ) { || divs0( value ) }
        else
          div( 'container' ) { || array_div( value ) }
        end
      end
    end

    def self.process( value )
      begin
        doc = YAML.load( value )
        divs( doc )
      rescue Exception => e
        puts "[ERROR] #{e.message}"
        puts e.backtrace.map{|s|" * #{s}"} * $/

        e.message
      end
    end
  end
end
