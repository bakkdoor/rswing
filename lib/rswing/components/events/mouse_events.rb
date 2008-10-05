module Gui
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
