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
    JComboBox = javax.swing.JComboBox
    
    class ComboBox < JComboBox
      include Component
      
      # Valid items are either an array or a ComboBoxModel object.
      # e.g.: <tt>["First item", "Second item"]</tt> (default: nil)
      #
      # Valid options are:
      # 1. <tt>:belongs_to => container</tt> (default: nil)
      # 2. <tt>:name => :text_field</tt> (default: nil)
      def initialize(items = nil, options = {})
        if(items.kind_of? javax.swing.ComboBoxModel)
          super(items)
        elsif(items.kind_of? Array)
          super(items.to_java(:Object))
        else
          super()
        end
        
        unless options.empty?
          Container.add_if_requested(self, options)
        end
      end
      
      # Returns an item at a given index.
      # Equivalent to ComboBox#item_at
      def [](item_index)
        self.item_at(item_index)
      end
      
      # Returns the items of this ComboBox as an Array.
      def items
        @items = []
        
        self.item_count.times do |i|
          @items << self[i]
        end
        
        @items
      end
      
    end
  
  end
end