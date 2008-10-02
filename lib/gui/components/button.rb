module Gui
  module Components
    require "java"
    require "events/focus_events"
    require "options"
    require "listener"
    include_package 'javax.swing'
    ActionListener = java.awt.event.ActionListener
    
    # Button-Klasse. Instanzen wrappen JButton Objekte.
    class Button < JButton
      include Events::FocusEvents
      
      # - <tt>text</tt>: Der Text, der auf dem Button stehen soll
      # - <tt>options</tt>: Options-Hash mit folgenden fültigen werten:
      # 1. <tt>:visible => true</tt>
      # 2. <tt>:enabled => true</tt>
      # 3. <tt>:belongs_to => nil</tt> # Container, dem dieser Button zugeordnet werden soll (default: keiner)
      # 4. <tt>:layout => nil</tt> # Layout-Optionen (z.B. GridBagContraints-Objekt) (default: keine)
      # 5. <tt>:icon => nil</tt> # Icon-Symbol der neben/anstatt des Textes auf dem Button erscheinen soll (default: keins)
      # 6. <tt>:name => :okButton</tt> Name des Buttons für Zugriff über parent-container (default: keiner)
      def initialize(text, options = {}, &block)
        super(text)
        
        self.visible = Options.value_for(options => :visible)
        self.enabled = Options.value_for(options => :enabled)
        self.icon = Options.value_for(options => :icon)

        # wenn block gegeben, rufe ihn mit dem aktuellen objekt auf
        if block_given?
          yield self
        end
        
        if(container = Options.value_for(options => :belongs_to))
          if(Options.value_for(options => :layout) || Options.value_for(options => :name))
            container.add(self, options)
          else
            container.add(self)
          end
        end
      end

      # Eventhandler für clicked (actionPerfomed) Event.
      # Nimmt einen block, welcher dann bei diesem Event ausgeführt wird.
      def on_click(&block)
        self.add_action_listener(Listener.create(ActionListener, :actionPerformed, &block))
      end
    end 
  end
end