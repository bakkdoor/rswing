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
    module Events
      module Event
        def event_for(listener_class_method_hash)
          module_with_event = listener_class_method_hash.keys.first
          event_name = listener_class_method_hash.values.first
        
          event_listener_class = listener_class_method_hash.keys.last
          java_method_name = listener_class_method_hash.values.last
        
          module_with_event.module_eval do
            define_method("__real_#{event_name}") do |block, *args|
              self.send("add#{event_listener_class.java_class.name.split(".").last}", 
                        Listener.create(event_listener_class, java_method_name, &block))
            end
          
            # some funky code here, since we need do define the interface-method
            # which will itself call our 'real' method. this is a workaround for ruby 1.8 since 
            # it isn't possible to define_method a method with a &block via define_method. should work in 1.9
            # but for now, we keep it this (obviously ugly) way, since it works. 
            eval <<-EOM
              def #{event_name}(*args, &block)
                __real_#{event_name}(block, args)
              end
            EOM
            
          end
        end
      end
    end
  end
end