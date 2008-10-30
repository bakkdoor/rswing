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
      module MouseEvents
        MouseListener = java.awt.event.MouseListener
        
        event_for self => :on_mouse_clicked, MouseListener => :mouseClicked
        event_for self => :on_mouse_entered, MouseListener => :mouseEntered
        event_for self => :on_mouse_exited, MouseListener => :mouseExited
        event_for self => :on_mouse_pressed, MouseListener => :mousePressed
        event_for self => :on_mouse_released, MouseListener => :mouseReleased
      end
    end
  end
end
