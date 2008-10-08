module RSwing
  module Components
    module Window
      # Initializes a given Window object with some options.
      # Valid options include:
      # 1. <tt>:size => [100,200] # 100x200 pixels</tt> (default: nil)
      # 2. <tt>:location => [50,50] # Upper left window corner location on screen</tt> (default: nil)
      def self.init(window, options = {})
        if(size = Options.value_for(options => :size))
          window.size = size
        end
        
        if(location = Options.value_for(options => :location))
          window.location = location
        end
      end
      
      # Sets the size of the window. Should be a two-dimensional <tt>Array</tt> of integers.
      # Example: <tt>window.location = [800, 600] # 800x600 pixels</tt> 
      def size=(new_size = nil) 
        if new_size && new_size.kind_of?(Array)
          self.setSize(java.awt.Dimension.new(new_size[0], new_size[1]))
        elsif new_size.kind_of? java.awt.Dimension
          self.setSize(new_size)
        end
      end
      
      # Sets the location of the window. Should be a two-dimensional <tt>Array</tt> of integers.
      # 
      # Example: 
      # <tt>window.size = [100, 200] # Upper left window position at (100,200)</tt>
      # 
      # Also valid standard locations are:
      # 1. <tt>:center</tt>
      # 2. <tt>:upper_left</tt>
      # 3. <tt>:upper_right</tt>
      # 4. <tt>:lower_left</tt>
      # 5. <tt>:lower_right</tt>
      # 6. <tt>:top_center</tt>
      # 7. <tt>:bottom_center</tt>
      def location=(new_location = :center)
        if new_location
          if new_location.kind_of?(Array)
            self.setLocation(java.awt.Point.new(new_location[0], new_location[1]))
          elsif new_location.kind_of? java.awt.Point
            self.setLocation(new_location)
          else
            # possibly one of the following standard options was chosen:
            screen_dimension = java.awt.Toolkit.default_toolkit.screen_size
            case new_location
            when :center
              x = ((screen_dimension.width - self.width) / 2).to_i
              y = ((screen_dimension.height - self.height) / 2).to_i
            when :upper_left
            when :upper_right
            when :lower_left
            when :lower_right
            when :top_center
            when :bottom_center
            end
            
            # set the new location for window
            self.location = [x, y]
          end
        end
      end
    end
  end
end
