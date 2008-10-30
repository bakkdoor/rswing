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
    JTextField = javax.swing.JTextField
    
    class TextField < JTextField
      # Valid options are:
      # 1. <tt>:text => "text"</tt> (default: "")
      # 2. <tt>:columns => 5</tt> (default: 10)
      # 3. <tt>:doc => nil</tt> (default: nil)
      # 4. <tt>:font => nil</tt> (default nil)
      # 5. <tt>:visible => false</tt> (default: true)
      # 6. <tt>:editable => false</tt> (default: true)
      def initialize(options = {})
        if(options.empty?)
          super()
        else
          if(doc = Options.value_for(options => :doc))
            super(doc, Options.value_for(options => :text), Options.value_for(options => :columns))
          else
            super(Options.value_for(options => :text), Options.value_for(options => :columns))
          end
        end
        
        Container.add_if_requested(self, options)
      end
    end
  
  end
end