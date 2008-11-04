module ComboboxExample
  require "rubygems"
  require "rswing"

  include RSwing::Components
  
  GridBagLayout = java.awt.GridBagLayout
  
  frame = Frame.new "ComboBox example",
                    :size => [400,200],
                    :location => :center do |frame|
    
    frame.default_close_operation = :exit_on_close
    
    Panel.new :name => :panel,
              :belongs_to => frame,
              :layout_manager => GridBagLayout.new do |panel|
                
      combobox_items = ["Value 1", "Value 2", "Value 3"]
      ComboBox.new combobox_items,
                   :belongs_to => panel,
                   :name => :combobox
      
      Button.new  "OK",
                  :belongs_to => panel,
                  :name => :ok_button
                 
      Button.new  "Cancel",
                  :belongs_to => panel,
                  :name => :cancel_button
                
    end
    
    frame.visible = true
    
  end
  
  # event handlers
  panel = frame[:panel]
  
  panel[:ok_button].on_click do
    selected_item = panel[:combobox].selected_item
    Dialog.show "Value selected: #{selected_item}", 
                :dialog_type => :info, 
                :title => "You have selected an item.", 
                :belongs_to => frame
  end
  
  panel[:cancel_button].on_click do
     frame.dispose
  end
  
end