module Gui
  module Components
    require "java"
    require "Gui/Components/container"
    class Frame < javax.swing.JFrame
      include Container
      
      def initialize(title)
        super(title)
      end
      
      def add(component, options = {})
        if(layout = Options.value_for(options => :layout))
          self.content_pane.add(component, layout)
        else
          self.content_pane.add(component)
        end
        
        
        # wenn :name angegeben wurde, mit aufnehmen
        if(name = Options.value_for(options => :name))
          self.add_with_name(component, name)
        end
        
        component #zurückgeben
      end
    end
  end
end