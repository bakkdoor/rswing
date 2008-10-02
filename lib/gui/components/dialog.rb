module Gui
  module Components
    require "java"
    require "container"
    
    JOptionPane = javax.swing.JOptionPane
    JDialog = javax.swing.JDialog
    
    # Dialog-Klasse. Stellt statische Methoden bereit um Message-Dialoge zu erstellen.
    class Dialog < JDialog
      include Container
      
      def initialize(owner, title, options = {}, &block)
        super(owner, title, Options.value_for(options => :modal))
        
        if(name = Options.value_for(options => :name) && owner.class.include?(Container))
          owner.add_with_name(self, name)
        end
        
        # block aufrufen mit aktuellem objekt, falls vorhanden
        if block_given?
          yield self
        end
        
      end
      
      def add(component, options = {})
        if(layout = Options.value_for(options => :layout))
          self.content_pane.add(component, layout)
        else
          self.content_pane.add(component)
        end
        
        
        # wenn :name angegeben wurde, mit aufnehmen
        if(name = Options.value_for(options => :name))
          self.add_with_name(component, name)
        end
        
        component #zurückgeben
      end
      
      # Erstellt einen MessageDialog.
      # - <tt>parent</tt>: Parent-Container für diesen Dialog.
      # - <tt>message</tt>: Nachricht, welche in dem Dialog dargestellt wird.
      # - <tt>options</tt>: Options-Hash mit folgenden gültigen Werten:
      # 1. <tt>:dialog_type => (:error | :question | :plain | :warning | :info)</tt> (default: :info)
      # 2. <tt>:title => "mein titel"</tt> (defailt: <tt>""</tt>)
      # 3. <tt>:modal => false</tt> (default: true)
      def self.show(parent, message, options = {})
        message_type =
          case Options.value_for(options => :dialog_type)
          when :error
            JOptionPane::ERROR_MESSAGE
          when :question
            JOptionPane::QUESTION_MESSAGE
          when :plain
            JOptionPane::PLAIN_MESSAGE
          when :warning
            JOptionPane::WARNING_MESSAGE
          else
            JOptionPane::INFORMATION_MESSAGE
          end
        
        JOptionPane.showMessageDialog(parent, message, Options.value_for(options => :title), message_type)
      end
      
      # Erstellt OptionsDialog (Dialog mit Auswahl mehrerer Optionen)
      # - <tt>parent</tt>: Parent-Container für diesen Dialog.
      # - <tt>message</tt>: Nachricht, welche in dem Dialog dargestellt wird.
      # - <tt>options</tt>: Options-Hash mit folgenden gültigen Werten:
      # 1. <tt>:option_type => (:yes_no | :yes_no_cancel)</tt> (default: <tt>:yes_no</tt>)
      # 2. <tt>:option_values => ["OK", "Cancel", "Quit"]</tt> (default: <tt>["Ja", "Nein"]</tt>)
      # 3. <tt>:title => "mein titel"</tt> (default: <tt>""</tt>)
      # 4. <tt>:modal => false</tt> (default: <tt>true</tt>)
      # 5. <tt>:icon => nil</tt> (default: keins)
      def self.showOption(parent, message, options = {})
        title = options[:title].nil? ? "Bitte wählen Sie" : options[:title]
        icon = Options.value_for(options => :icon) 
        
        option_type = option_type_for(Options.value_for(options => :option_type))
        option_values = Options.value_for(options => :option_values)
          
        selected_option_index = JOptionPane.showOptionDialog(parent, message, title, option_type, JOptionPane::QUESTION_MESSAGE, icon, 
				option_values.to_java(:Object), nil);
                              
        option_values[selected_option_index]
      end
      
      def self.option_type_for(option_type)
        case option_type
        when :yes_no
          JOptionPane::YES_NO_OPTION
        else
          JOptionPane::YES_NO_CANCEL_OPTION
        end
      end

    end    
  end
end

