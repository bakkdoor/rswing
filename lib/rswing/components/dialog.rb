###############################################################################
# This file is part of RSwing.                                                #
# RSwing - Swing wrapper for JRuby                                            #
# (C) 2008 Christopher Bertels (bakkdoor@flasht.de)                           #
#                                                                             #
# RSwing is free software: you can redistribute it and/or modify              #
# it under the terms of the GNU Lesser General Public License as published by #
# the Free Software Foundation, either version 3 of the License, or           #
# (at your option) any later version.                                         #
#                                                                             #
# RSwing is distributed in the hope that it will be useful,                   #
# but WITHOUT ANY WARRANTY; without even the implied warranty of              #
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the               #
# GNU Lesser General Public License for more details.                         #
#                                                                             #
# You should have received a copy of the GNU Lesser General Public License    #
# along with RSwing.  If not, see <http://www.gnu.org/licenses/>.             #
###############################################################################

module RSwing
  module Components
    JOptionPane = javax.swing.JOptionPane
    JDialog = javax.swing.JDialog
    
    # Dialog-Class.
    # Has static methods to create Message-Dialogs.
    # (<tt>show()</tt> and <tt>showOptions</tt>).
    # Can also be used to create custom dialogs by extending from this class.
    class Dialog < JDialog
      include Window
      include Container
      
      def initialize(title, options = {}, &block)
        super(Options.value_for(options => :belongs_to), title, Options.value_for(options => :modal))
        
        Window.init(self, options)
        
        if(name = Options.value_for(options => :name) && owner.class.include?(Container))
          owner.add_with_name(self, name)
        end
        
        # call block with current object, if given
        if block_given?
          yield self
        end
      end
      
      # Creates a MessageDialog.
      # - <tt>message</tt>: Message, to be displayed in this dialog.
      # - <tt>options</tt>: Options-Hash with the following valid values:
      # 1. <tt>:dialog_type => (:error | :question | :plain | :warning | :info)</tt> (default: :info)
      # 2. <tt>:title => "my title"</tt> (defailt: <tt>""</tt>)
      # 3. <tt>:modal => false</tt> (default: true)
      # 4. <tt>:belongs_to => parent</tt> Parent-Container for this dialog (default: nil)
      def self.show(message, options = {})
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
        
        JOptionPane.showMessageDialog(Options.value_for(options => :belongs_to), message, 
          Options.value_for(options => :title), message_type)
      end
      
      # Creates a OptionsDialog (Dialog with selection for different Options).
      # - <tt>message</tt>: Message, to be displayed in the dialog.
      # - <tt>options</tt>: Options-Hash with the following valid values:
      # 1. <tt>:option_type => (:yes_no | :yes_no_cancel)</tt> (default: <tt>:yes_no</tt>)
      # 2. <tt>:option_values => ["OK", "Cancel", "Quit"]</tt> (default: <tt>["Yes", "No"]</tt>)
      # 3. <tt>:title => "my title"</tt> (default: <tt>""</tt>)
      # 4. <tt>:modal => false</tt> (default: <tt>true</tt>)
      # 5. <tt>:icon => nil</tt> (default: nil)
      # 6. <tt>:belongs_to => parent</tt> Parent-Container for this dialog (default: nil)
      def self.showOption(message, options = {})
        title = options[:title].nil? ? Options.gui_options[:option_default_title] : options[:title]
        icon = Options.value_for(options => :icon) 
        
        option_type = option_type_for(Options.value_for(options => :option_type))
        option_values = Options.value_for(options => :option_values)
          
        selected_option_index = JOptionPane.showOptionDialog(Options.value_for(options => :belongs_to), message, 
          title, option_type, JOptionPane::QUESTION_MESSAGE, icon, option_values.to_java(:Object), nil);
                              
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

