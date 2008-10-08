module RSwing
  module Components
    class Options
      # Hash of all valid default-values for rswing options.
      def self.gui_options
        {
          :enabled => true,
          :visible => true,
          :editable => true,
          :resizable => true,
          :modal => true,
          :double_buffer => true,
          :dialog_type => :info,
          :option_type => :yes_no,
          :option_values => ["Yes", "No"],
          :option_default_title => "Please select:",
          :icon => nil,
          :belongs_to => nil,
          :layout => nil,
          :layout_manager => nil,
          :title => nil,
          :name => nil,
          :font => nil,
          :doc => nil,
          :size => nil,
          :columns => 10,
          :text => ""
        }
      end

      # Returns the value of a key (which is given as the value of the hash).
      # If the value to the key isn't given in the hash, return the 
      # default-value from <tt>gui_options</tt>-hash.
      # * Example:
      #     <tt>Options.value_for(options => :name)</tt>
      def self.value_for(hash)
        raise "Value must be a hash!" unless hash.kind_of? Hash
        hash.each_pair do |options_hash, option_key|
          # es sollte nur ein paar angegeben werden, sodass wir einfach nur das erste nehmen
          # und den entsprechenden wert zurückgeben
          return options_hash[option_key].nil? ? gui_options[option_key] : options_hash[option_key]
        end
      end
    end
  end
end