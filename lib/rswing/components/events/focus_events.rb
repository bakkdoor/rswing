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
