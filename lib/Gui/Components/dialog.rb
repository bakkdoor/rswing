module Gui
  module Components
    require "java"
    JOptionPane = javax.swing.JOptionPane
    
    class Dialog
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

