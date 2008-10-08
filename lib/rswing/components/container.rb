module RSwing
  module Components
    module Container
      
      # Adds a component with a set of options to this container.
      def add(component, options = {})
        if(self.respond_to?(:getContentPane))
          self.add_to_content_pane(component, options)
        else
#          this should be handled somehow later on:
#          if(layout = Options.value_for(options => :layout))
#            super(component, layout)
#          else
             super(component)
#          end
        end
        
        # if :name given, add with name
        if(name = Options.value_for(options => :name))
          self.add_with_name(component, name)
        end
        
        component # return component
      end
      
      # Adds a component to the component_hash with a given name symbol.
      # Raises an exception if name already taken.
      def add_with_name(component, name_symbol)
        if self.component_hash.has_key?(name_symbol)
          raise "Name in Component bereits vergeben!"
        else
          self.component_hash[name_symbol] = component
        end
      end
      
      # Removes a component from this container. 
      # Also removes it from the component_hash
      def remove(component)
        super.remove(component)
        # delete all entries with component as value in component_hash
        self.component_hash.delete_if { |key,value| value == component }
      end
      
      # Returns the component with a given name inside of this container (if available).
      # * <tt>name_symbol</tt> Name (as symbol) of the component to get.
      def [](name_symbol)
        if self.component_hash.has_key?(name_symbol)
          self.component_hash[name_symbol] # erstes hash mit diesem namen als key zurückgeben
        else
          nil
        end
      end
      
      # Adds a component to a container, if specified via :belongs_to in options.
      def self.add_if_requested(component, options)
        if(container = Options.value_for(options => :belongs_to))
          if(Options.value_for(options => :layout) || Options.value_for(options => :name))
            container.add(component, options)
          else
            container.add(component)
          end
        end
      end
      
      protected
      # Name-Component-hash.
      # For example:
      # * <tt>{:okButton => okButtonObject, :cancelButton => cancelButtonObject}</tt>
      def component_hash
        @component_hash ||= {}
      end
      
      # Adds a component with given options to the <tt>content_pane</tt> of a container.
      # This will only work, if the container actually has a <tt>content_pane</tt>
      # and should only be called by the <tt>add()</tt> method inside of the
      # <tt>container</tt> module.
      def add_to_content_pane(component, options)
        if(layout = Options.value_for(options => :layout))
          self.content_pane.add(component, layout)
        else
          self.content_pane.add(component)
        end
      end
    end
  end
end