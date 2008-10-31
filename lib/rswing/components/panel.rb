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
    JPanel = javax.swing.JPanel
    
    class Panel < JPanel
      include Container
      include Events::KeyEvents
      include Events::MouseEvents
      include Events::FocusEvents
      
      def initialize(options = {}, &block)
        super(Options.value_for(options => :layout_manager), Options.value_for(options => :double_buffer))
        
        if (border_title = Options.value_for(options => :title))
          border = BorderFactory.createTitledBorder(border_title)
          border.title_font = Font.new("Arial", Font::BOLD, 14)
          self.border = border
        end      
        
        # call block with current object, if given
        if block_given?
          yield self
        end
        
        Container.add_if_requested(self, options)
      end
    end 
  end
end