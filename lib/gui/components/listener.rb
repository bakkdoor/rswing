module Gui
  module Components
    class Listener
      # Erstellt eine Listener-Klasse des angegebenen listener_interfaces 
      # (Java Listener Interface), die alle Interface-Methoden leer haelt
      # ausser derjenigen, die mit <tt>methodname</tt> angegeben wurde
      # (und deren Inhalt mit dem angegebenen <tt>block</tt> gefüllt wird).
      # Gibt anschließend eine neue Instanz dieser Listener-Klasse zurück
      def self.create(listener_interface, methodname, &block)
        listener_class = Class.new() do
          include listener_interface
          implement listener_interface
          def initialize(methodname, &block)
            self.class.instance_eval do
              define_method(methodname, &block)
            end
          end
        end
        # neue instanz zurückgeben
        listener_class.new(methodname, &block)
      end
    end
  end
end