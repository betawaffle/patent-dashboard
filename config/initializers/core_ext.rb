module CoreExtentions
  module String
    def brackets_with_translation(*args)
      args = [underscore.tr(' ', '_').to_sym] if args.empty? 
      
      if args.first.is_a? Symbol
        I18n.translate(args.unshift, :default => args.push(self))
      else
        brackets_without_translation(*args)
      end
    end
    
    def self.included(base)
      base.class_eval do
        alias :brackets :[]
        alias_method_chain :brackets, :translation
        alias :[] :brackets
      end
    end
  end
end

String.send :include, CoreExtentions::String
