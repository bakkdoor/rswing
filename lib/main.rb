module Main
  #Java.set_deprecated_interface_syntax true
  
  require "java"
  include_package 'javax.swing'
  Dir.glob(File.join(File.dirname(__FILE__), 'Gui/Components/*.rb')).each {|f| require f }
  include Gui
  include Gui::Components
  
  frame = Frame.new("hallo, welt")
  frame.default_close_operation = JFrame::EXIT_ON_CLOSE
  
  #layout_options = GridBagContraint.new()
  
  Button.new("test", :belongs_to => frame, :name => :testButton) do |btn|
    btn.on_click do
      Dialog.show(frame, "mein text", :dialog_type => :error, :title => "hello, world")
#      Dialog.showOption frame, "bitte auswählen:", :option_type => :yes_no,
#        :option_values => ["Aha", "ohno"], :title => "auswahl treffen!"
    end
  
    btn.on_focus do
      puts "button hat jetzt focus"
    end
    
    btn.on_focus_lost do
      puts "button hat focus verloren"
    end
  end
  
  puts "text von testButton: #{frame[:testButton].text}"
  
  frame.pack
  
  options = ["Herr", "Frau", "Geek"]
  selected_value = Dialog.showOption(frame, options.join(" oder ") + "?", :option_values => options, :option_type => :yes_no_cancel)
  puts "#{selected_value} wurde ausgewählt"

  frame.visible = true
  
end