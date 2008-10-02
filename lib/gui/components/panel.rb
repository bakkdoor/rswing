module Gui
  module Components
    require "java"
    require "gui/components/container"
    include_package 'javax.swing'
    
    class Panel < JPanel
      include Container
      
      def initialize(layout_manager, options = {}, &block)
        super(layout_manager, Options.value_for(options => :double_buffer))
        
        if (border_title = Options.value_for(options => :title))
          border = BorderFactory.createTitledBorder(border_title)
          border.title_font = Font.new("Arial", Font::BOLD, 14)
          self.border = border
        end      
        
        # block aufrufen mit aktuellem objekt, falls vorhanden
        if block_given?
          yield self
        end
      end
      
      def add(component, options = {})
        super.add(component)
        
        if(name = Options.value_for(options => :name))
          self.add_with_name(component, name)
        end
      end
    end
    
  end
end