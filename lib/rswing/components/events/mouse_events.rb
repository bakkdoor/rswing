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
    module Events
      module MouseEvents
        MouseListener = java.awt.event.MouseListener
        
        def on_mouse_clicked(&block)
          self.add_key_listener(Listener.create(MouseListener, :mouseClicked, &block))
        end
      
        def on_mouse_entered(&block)
          self.add_key_listener(Listener.create(MouseListener, :mouseEntered, &block))
        end
      
        def on_mouse_exited(&block)
          self.add_key_listener(Listener.create(MouseListener, :mouseExited, &block))
        end
      
        def on_mouse_pressed(&block)
          self.add_key_listener(Listener.create(MouseListener, :mousePressed, &block))
        end
      
        def on_mouse_released(&block)
          self.add_key_listener(Listener.create(MouseListener, :mouseReleased, &block))
        end
      end
    end
  end
end
