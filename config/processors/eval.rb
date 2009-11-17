#===============================================================
# Generator: Eval
#   Created: 2009.11.17
#
#     Brief: Takes ruby code and returns last statement's value
#===============================================================

module TemplateProcessor
  class Eval < Ream::Blog::TemplateProcessor
    def self.process( value )
      begin
        eval( value )
      rescue Exception => e
        puts "[ERROR] #{e.message}"
        puts e.backtrace.map{|s|" * #{s}"} * $/

        e.message
      end
    end
  end
end
