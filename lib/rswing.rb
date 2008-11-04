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

# needed for swing classes
require "java"

# expand search path to components subdir.
$: << File.expand_path(File.dirname(__FILE__) + "/rswing/components")

require "events/event"

# add "has_event"-method to Module-class for easy access in event-modules.
class Module
  include RSwing::Components::Events::Event
end

# event-modules
require "events/component_events"
require "events/container_events"
require "events/focus_events"
require "events/hierarchy_bounds_events"
require "events/hierarchy_changed"
require "events/input_method_events"
require "events/key_events"
require "events/mouse_events"
require "events/mouse_motion_events"
require "events/mouse_wheel_events"
require "events/property_changed"
require "events/window_events"
require "events/window_focus"
require "events/window_state"


# containers
require "component"
require "container"
require "window"

require "button"
require "combo_box"
require "dialog"
require "frame"
require "listener"
require "options"
require "panel"
require "text_field"

# RSwing root module
module RSwing  
  include_package 'javax.swing'
end