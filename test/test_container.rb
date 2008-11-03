require "test/unit"

require "rswing"
require "test/test_helper"

class TestContainer < Test::Unit::TestCase
  include RSwing::Components
  include TestHelper
  
  def setup
    @container = Frame.new "my frame"
    @button = Button.new "by button"
  end
  
  def test_indexer
    btn = Button.new "my button", :belongs_to => @container, :name => :button
    assert_equal(@container[:button], btn)
  end
  
  def test_add
    @container.add @button
    assert(@container.components.include?(@button), "container should have button!")
  end
  
  def test_remove
    test_add
    @container.remove @button
    assert(! @container.components.include?(@button), "container should not have button!")
  end
  
  def test_add_if_requested
    Container.add_if_requested @button, {}
    assert(! @container.components.include?(@button), "container should not have button!")
    
    Container.add_if_requested @button, :belongs_to => @container, :name => :new_button
    assert(@container.components.include?(@button), "container now should have button!")
    assert_not_nil(@container[:new_button], "container now should have button!")
  end
  
  def test_components
    frame = Frame.new "my frame"
    panel = Panel.new
   
    frame.add @button
    assert(frame.components.include?(@button), "frame should have button!")
    
    panel.add @button
    assert(panel.components.include?(@button), "panel should have button!")
  end
  
  def test_events
    frame = Frame.new "my frame"
    should_have_events frame => [:on_focus, :on_focus_lost, :on_property_changed]
  end
end