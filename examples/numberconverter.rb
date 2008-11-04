module Numberconverter
  
  #require "rubygems"
  require "lib/rswing"

  include RSwing::Components

  GridBagLayout = java.awt.GridBagLayout

  frame = Frame.new "Numberconverter",
                    :size => [400, 100], 
                    :location => :center do |frame|

    frame.default_close_operation = :exit_on_close

    Panel.new :name => :panel,
              :belongs_to => frame, 
              :layout_manager => GridBagLayout.new do |panel|

      TextField.new :text => "0", 
                    :columns => 10, 
                    :belongs_to => panel, 
                    :name => :entry_field

      Button.new  "Convert", 
                  :belongs_to => panel, 
                  :name => :button

      TextField.new :text => "Output", 
                    :columns => 10, 
                    :belongs_to => panel, 
                    :name => :output_field
    end

    frame.visible = true
  end

  # eventhandler code
  panel = frame[:panel]
  panel[:button].on_click do
     result = Dialog.showOption "Please select:", 
                                :option_type => :yes_no, 
                                :option_values => ["HEX", "BINARY"],
                                :title => "Pick an option!", 
                                :belongs_to => frame

     base = 10 # standardwert
     if result == "HEX"
       base = 16
     else
       base = 2
     end
     panel[:output_field].text = panel[:entry_field].text.to_i.to_s(base)
  end

end