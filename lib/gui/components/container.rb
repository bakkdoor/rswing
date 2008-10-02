module Gui
  module Components
    module Container
      def add_with_name(component, name_symbol)
        if self.component_hash.has_key?(name_symbol)
          raise "Name in Component bereits vergeben!"
        else
          self.component_hash[name_symbol] = component
        end
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
      
      protected
      # liste von hashes, die jeweils so aussehen: {:okButton => buttonObject}
      def component_hash
        @component_hash ||= {}
      end
    end
  end
end