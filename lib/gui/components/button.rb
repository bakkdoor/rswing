module Gui
  module Components
    require "java"
    require "events/focus_events"
    require "options"
    require "listener"
    include_package 'javax.swing'
    ActionListener = java.awt.event.ActionListener
    
    # Button-Class. Wraps JButton-Class.
    class Button < JButton
      include Events::FocusEvents
      
      # - <tt>text</tt>: The Text to be displayed on the button.
      # - <tt>options</tt>: Options-Hash with the following valid values:
      # 1. <tt>:visible => true</tt>
      # 2. <tt>:enabled => true</tt>
      # 3. <tt>:belongs_to => nil</tt> # Container to which this button should be added (default: none)
      # 4. <tt>:layout => nil</tt> # Layout-Options (e.g. GridBagContraints-Object) (default: none)
      # 5. <tt>:icon => nil</tt> # Icon-Symbol to be displayed next to/instead of the text on the button (default: none)
      # 6. <tt>:name => :okButton</tt> Name of the buttons for access via parent-container (default: none)
      def initialize(text, options = {}, &block)
        super(text)
        
        self.visible = Options.value_for(options => :visible)
        self.enabled = Options.value_for(options => :enabled)
        self.icon = Options.value_for(options => :icon)

        # call block with current object, if given
        if block_given?
          yield self
        end
        
        Container.add_if_requested(self, options)
      end

      # Eventhandler for clicked (actionPerformed) event.
      # Takes a block, which will be executed if this event occurs.
      def on_click(&block)
        self.add_action_listener(Listener.create(ActionListener, :actionPerformed, &block))
      end
    end 
  end
end