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
    module Events
      module WindowEvents
        WindowListener = java.awt.event.WindowListener
        
        def WindowEvents.event_mappings
          {
            :on_window_activated => :windowActivated,
            :on_window_closed => :windowClosed,
            :on_window_closing => :windowClosing,
            :on_window_deactivated => :windowDeactivated,
            :on_window_deiconified => :windowDeiconified,
            :on_window_iconified => :windowIconified,
            :on_window_opened => :windowOpened
          }
        end
        
        Events.map self, WindowListener, event_mappings
        
      end
    end
  end
end
