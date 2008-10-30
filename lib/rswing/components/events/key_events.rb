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
      module KeyEvents
        KeyListener = java.awt.event.KeyListener
        
        def on_key_pressed(&block)
          self.add_key_listener(Listener.create(KeyListener, :keyPressed, &block))
        end
      
        def on_key_released(&block)
          self.add_key_listener(Listener.create(KeyListener, :keyReleased, &block))
        end
      
        def on_key_typed(&block)
          self.add_key_listener(Listener.create(KeyListener, :keyTyped, &block))
        end
      end
    end
  end
end
