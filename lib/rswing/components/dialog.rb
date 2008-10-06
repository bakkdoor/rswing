module RSwing
  module Components
    JOptionPane = javax.swing.JOptionPane
    JDialog = javax.swing.JDialog
    
    # Dialog-Class.
    # Has static methods to create Message-Dialogs.
    # (<tt>show()</tt> and <tt>showOptions</tt>).
    # Can also be used to create custom dialogs by extending from this class.
    class Dialog < JDialog
      include Container
      
      def initialize(owner, title, options = {}, &block)
        super(owner, title, Options.value_for(options => :modal))
        
        if(name = Options.value_for(options => :name) && owner.class.include?(Container))
          owner.add_with_name(self, name)
        end
        
        # call block with current object, if given
        if block_given?
          yield self
        end
        
      end
      
      # Adds a component with a set of options to this dialog.
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
      
      # Creates a MessageDialog.
      # - <tt>parent</tt>: Parent-Container for this dialog.
      # - <tt>message</tt>: Message, to be displayed in this dialog.
      # - <tt>options</tt>: Options-Hash with the following valid values:
      # 1. <tt>:dialog_type => (:error | :question | :plain | :warning | :info)</tt> (default: :info)
      # 2. <tt>:title => "my title"</tt> (defailt: <tt>""</tt>)
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
      
      # Creates a OptionsDialog (Dialog with selection for different Options).
      # - <tt>parent</tt>: Parent-Container for this dialog.
      # - <tt>message</tt>: Message, to be displayed in the dialog.
      # - <tt>options</tt>: Options-Hash with the following valid values:
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
      
      # Returns a JOptionPane-specific option_type for a given rswing-option_type.
      # For example: 
      # 1. <tt>:yes_no</tt> => <tt>JOptionPane::YES_NO_OPTION</tt>
      # 2. <tt>:yes_no_cancel</tt> => <tt>JOptionPane::YES_NO_CANCEL_OPTION</tt>
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

