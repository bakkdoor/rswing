###############################################################################
# This file is part of RSwing.                                                #
# RSwing - Swing wrapper for JRuby                                            #
# (C) 2008 Christopher Bertels (bakkdoor@flasht.de)                           #
#                                                                             #
# RSwing is free software: you can redistribute it and/or modify              #
# it under the terms of the GNU Lesser General Public License as published by #
# the Free Software Foundation, either version 3 of the License, or           #
# (at your option) any later version.                                         #
#                                                                             #
# RSwing is distributed in the hope that it will be useful,                   #
# but WITHOUT ANY WARRANTY; without even the implied warranty of              #
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the               #
# GNU General Public License for more details.                                #
#                                                                             #
# You should have received a copy of the GNU Lesser General Public License    #
# along with RSwing.  If not, see <http://www.gnu.org/licenses/>.             #
###############################################################################

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
              x = 0
              y = 0
            when :upper_right
              x = screen_dimension.width - self.width
              y = 0
            when :lower_left
              x = 0
              y = screen_dimension.height - self.height
            when :lower_right
              x = screen_dimension.width - self.width
              y = screen_dimension.height - self.height
            when :top_center
              x = ((screen_dimension.width - self.width) / 2).to_i
              y = 0
            when :bottom_center
              x = ((screen_dimension.width - self.width) / 2).to_i
              y = screen_dimension.height - self.height
            end
            
            # set the new location for window
            self.location = [x, y]
          end
        end
      end
    end
  end
end
