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
      # Erstellt eine Listener-Klasse des angegebenen listener_interfaces 
      # (Java Listener Interface), die alle Interface-Methoden leer haelt
      # ausser derjenigen, die mit <tt>methodname</tt> angegeben wurde
      # (und deren Inhalt mit dem angegebenen <tt>block</tt> gefüllt wird).
      # Gibt anschließend eine neue Instanz dieser Listener-Klasse zurück
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
        # neue instanz zurückgeben
        listener_class.new(methodname, &block)
      end
    end
  end
end