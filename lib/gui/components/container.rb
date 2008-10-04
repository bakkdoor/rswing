module Gui
  module Components
    module Container
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
      
      # Gibt das Component mit einem angegebenen Namen innerhalb dieses Containers zurück.
      # * <tt>name_symbol</tt> Name (als Symbol) des Components, das man haben möchte.
      def [](name_symbol)
        if self.component_hash.has_key?(name_symbol)
          self.component_hash[name_symbol] # erstes hash mit diesem namen als key zurückgeben
        else
          nil
        end
      end
      
      # fügt ein component einem container hinzu, falls dieser in options
      # via :belongs_to angegeben wurde.
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
      # liste von hashes, die jeweils so aussehen: {:okButton => buttonObject}
      def component_hash
        @component_hash ||= {}
      end
    end
  end
end