# needed for swing classes
require "java"

# expand search path to components subdir.
$: << File.expand_path(File.dirname(__FILE__) + "/rswing/components")

# event-modules
require "events/focus_events"
require "events/key_events"
require "events/mouse_events"

# containers
require "container"
require "window"

require "button"
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