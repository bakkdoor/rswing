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
# GNU Lesser General Public License for more details.                         #
#                                                                             #
# You should have received a copy of the GNU Lesser General Public License    #
# along with RSwing.  If not, see <http://www.gnu.org/licenses/>.             #
###############################################################################

module RSwing
  module Components
    JFrame = javax.swing.JFrame
    
    class Frame < JFrame
      include Window
      include Container
      
      # valid options are:
      # 1. <tt>:size => [800, 600]</tt> 800x600 pixels (default: nil)
      def initialize(title, options = {}, &block)
        super(title)
        
        Window.init(self, options)
        
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
    end
  end
end