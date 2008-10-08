module RSwing
  module Components
    JFrame = javax.swing.JFrame
    
    class Frame < JFrame
      include Container
      
      # valid options are:
      # 1. <tt>:size => [800, 600]</tt> 800x600 pixels (default: nil)
      def initialize(title, options = {}, &block)
        super(title)
        
        if(size = Options.value_for(options => :size))
          self.size = size
        end
        
        # falls block übergeben wurde, mit aktuellem objekt aufrufen
        if block_given?
          yield self
        end
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
      
      # Sets the size of the frame. Should be a two-dimensional Array of Integers.
      # Example: <tt>frame.size = [800, 600] # 800x600 pixels</tt> 
      def size=(new_size = nil) 
        if new_size && new_size.kind_of?(Array)
          self.setSize(java.awt.Dimension.new(new_size[0], new_size[1]))
        elsif new_size.kind_of? java.awt.Dimension
          self.setSize(new_size)
        end
      end
    end
  end
end