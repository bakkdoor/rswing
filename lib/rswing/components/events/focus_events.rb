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
      module FocusEvents
        FocusListener = java.awt.event.FocusListener
        
        # Eventhandler für focus (focusGained) Event.
        # Nimmt einen block, welcher dann bei diesem Event ausgeführt wird.
        def on_focus(&block)
          self.add_focus_listener(Listener.create(FocusListener, :focusGained ,&block))
        end
      
        # Eventhandler für focus_lost (focusLost) Event.
        # Nimmt einen block, welcher dann bei diesem Event ausgeführt wird.
        def on_focus_lost(&block)
          self.add_focus_listener(Listener.create(FocusListener, :focusLost ,&block))
        end
      end
    end
  end
end
