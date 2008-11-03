require "test/unit"

require "rswing"
require "test/test_helper"

class TestButton < Test::Unit::TestCase
  include RSwing::Components
  include TestHelper
  
  def setup
    @button = Button.new "hello world"
  end
  
  def test_events
    should_have_events @button => Events::ComponentEvents.event_mappings.keys
  end
end