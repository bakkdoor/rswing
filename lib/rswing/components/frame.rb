module RSwing
  module Components
    require "java"
    require "container"
    JFrame = javax.swing.JFrame
    
    class Frame < JFrame
      include Container
      
      def initialize(title, &block)
        super(title)
        
        # falls block übergeben wurde, mit aktuellem objekt aufrufen
        if block_given?
          yield self
        end
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
      
      # Sets the default close operation for this frame.
      # Valid operations are:
      # 1. <tt>:do_nothing_on_close</tt>
      # 2. <tt>:hide_on_close</tt> (default)
      # 3. <tt>:dispose_on_close</tt>
      # 4. <tt>:exit_on_close</tt>
      def default_close_operation=(op = :hide_on_close)
        case op
        when :do_nothing_on_close
          self.setDefaultCloseOperation(WindowConstants::DO_NOTHING_ON_CLOSE)
        when :hide_on_close
          self.setDefaultCloseOperation(WindowConstants::HIDE_ON_CLOSE)
        when :dispose_on_close
          self.setDefaultCloseOperation(WindowConstants::DISPOSE_ON_CLOSE)
        when :exit_on_close
          self.setDefaultCloseOperation(JFrame::EXIT_ON_CLOSE)
        end
      end
    end
  end
end