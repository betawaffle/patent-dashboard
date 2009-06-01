require 'sass'

module Sassy
  module TemplateHandlers
    class Sass
      def self.call(template)
        "#{name}.new(self).render(template, local_assigns)"
      end
      
      def initialize(view = nil)
        @view = view
      end
      
      def render(template, local_assigns)
        engine = ::Sass::Engine.new(parse_template(template.source))
        engine.render
      end
      
    private
      def parse_template(template)
        unit_pattern = /(?:(?:px|pt|cm|mm|in|em|ex|pc)\b|%)/
        src = template.gsub(/^@grid\s+([0-9]+)\s*,\s*([0-9]+#{unit_pattern})\s*,\s*([0-9]+#{unit_pattern})$/) do |m|
          generate_grid($1.to_i, $2, $3)
        end
        
        src.gsub!(/^@import\s+([a-z]+).sass/) do |m|
          
        end
      end
      
      def generate_grid(columns = 24, column_width = '30px', gutter_width = '10px')
        src = %(!column_width = #{column_width}\n!gutter_width = #{gutter_width}\n\n)
        src << %(!append_0 = 0px\n=append_0 \n  :padding-right = !append_0\n)
        src << %(=prepend_0 \n  :padding-left = !append_0\n\n)
        src << %(=last \n  :margin-right 0\n\n)
        
        (1..columns).each do |i| j = i - 1
          unless j.zero?
            src << %(!append_#{j} = !span_#{j} + !gutter_width\n=append-#{j} \n  :padding-right = !append_#{j}\n)
            src << %(=prepend_#{j} \n  :padding-left = !append_#{j}\n\n)
          end
          
          src << %(!span_#{i} = !column_width + !append_#{j} \n)
          src << %(=span_#{i} \n  :width = !span_#{i}\n  :float left\n  :margin-right = !gutter_width\n\n)
        end unless columns <= 0
        
        src << %(!container_width = !span_#{columns}\n\n)
      end
    end
  end
end
