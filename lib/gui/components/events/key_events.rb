module Gui
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
