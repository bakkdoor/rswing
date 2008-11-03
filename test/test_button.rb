require "test/unit"

require "rswing"

class TestButton < Test::Unit::TestCase
  include RSwing::Components
  
  def setup
    @button = Button.new "hello world"
  end
  
  def test_events
    assert(@button.respond_to?(:on_click), "no on_click method available!")
  end
end