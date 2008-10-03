module Gui
  module Components
    class Options
      # hash aller default-werte für gui-optionen.
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
          :option_values => ["Ja", "Nein"],
          :icon => nil,
          :belongs_to => nil,
          :layout => nil,
          :title => nil,
          :name => nil,
          :font => nil,
          :doc => nil,
          :columns => 10,
          :text => ""
        }
      end

      # Gibt Wert eines angegebenen Keys (als Wert des Hashs) zurück
      # Falls Wert nicht in Hash angegeben, nimm Default-Wert aus <tt>gui_options</tt>-hash.
      def self.value_for(hash)
        hash.each_pair do |options_hash, option_key|
          # es sollte nur ein paar angegeben werden, sodass wir einfach nur das erste nehmen
          # und den entsprechenden wert zurückgeben
          return options_hash[option_key].nil? ? gui_options[option_key] : options_hash[option_key]
        end
      end
    end
  end
end