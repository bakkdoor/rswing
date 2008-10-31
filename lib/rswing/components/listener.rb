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
    class Listener
      # Creates a Listener-Class of the given listener_interface (Java Listener Interface)
      # which has all interface methods implemented empty exceptt the one
      # specified by <tt>methodname</tt>. Its method-body gets filled by the given <tt>block</tt>.
      # Finally returns a new instance of this dynamically created Listener-Class.
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
        # return new instance of listener_class
        listener_class.new(methodname, &block)
      end
    end
  end
end