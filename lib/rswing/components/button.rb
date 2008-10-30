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
# GNU General Public License for more details.                                #
#                                                                             #
# You should have received a copy of the GNU Lesser General Public License    #
# along with RSwing.  If not, see <http://www.gnu.org/licenses/>.             #
###############################################################################

module RSwing
  module Components
    ActionListener = java.awt.event.ActionListener
    JButton = javax.swing.JButton
    
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