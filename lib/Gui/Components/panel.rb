module Gui
  module Components
    require "java"
    include_package 'javax.swing'
    
    class Panel < JPanel
      def initialize(layout_manager, border_title = nil)
        super(layout_manager)
        if border_title
          border = BorderFactory.createTitledBorder(border_title)
          border.title_font = Font.new("Arial", Font::BOLD, 14)
          self.border = border
        end      
      end
      
      def add(component)
        super.add(component)
      end
    end
    
  end
end