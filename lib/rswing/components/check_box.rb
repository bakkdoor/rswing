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
    JCheckBox = javax.swing.JCheckBox
    
    # CheckBox-Class. Wraps JCheckBox-Class.
    class CheckBox < JCheckBox
      include Component
      include Events::ButtonEvents
      
      # - <tt>text</tt>: The Text to be displayed on the checkbox.
      # - <tt>options</tt>: Options-Hash with the following valid values:
      # 1. <tt>:visible => true</tt>
      # 2. <tt>:enabled => true</tt>
      # 3. <tt>:selected => true</tt> # (default: false)
      # 4. <tt>:layout => nil</tt> # Layout-Options (e.g. GridBagContraints-Object) (default: none)
      # 5. <tt>:icon => nil</tt> # Icon-Symbol to be displayed next to/instead of the text on the checkbox (default: none)
      # 6. <tt>:name => :check_box</tt> Name of the checkbox for access via parent-container (default: none)
      def initialize(text, options = {}, &block)
        super(text, Options.value_for(options => :selected))
        
        self.visible = Options.value_for(options => :visible)
        self.enabled = Options.value_for(options => :enabled)
        self.icon = Options.value_for(options => :icon)

        # call block with current object, if given
        if block_given?
          yield self
        end
        
        unless options.empty?
          Container.add_if_requested(self, options)
        end
      end
    end 
  end
end