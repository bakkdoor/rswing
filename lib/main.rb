module Gui
  require "java"
  include_package 'javax.swing'
  #Dir.glob(File.join(File.dirname(__FILE__), 'gui/components/*.rb')).each {|f| require f }
  #Dir.glob(File.join(File.dirname(__FILE__), 'gui/components/events/*.rb')).each {|f| require f }

  $: << File.expand_path(File.dirname(__FILE__) + "/gui/components")

  require "frame"
  require "button"
  require "dialog"
  
  include Gui::Components
  
  # geht genauso wie die 'normale' variante:
  # frame = Frame.new("hallo, welt")
  # ... # hier dann einfach auch zugriffe auf frame
  Frame.new("hallo, welt") do |frame|
    frame.default_close_operation = JFrame::EXIT_ON_CLOSE

    Button.new("test", :belongs_to => frame, :name => :testButton) do |btn|

      btn.on_click do
        Dialog.showOption frame, "bitte auswählen:", :option_type => :yes_no,
          :option_values => ["Aha", "ohno"], :title => "auswahl treffen!"
      end

      btn.on_click do
        Dialog.show(frame, "mein text", :dialog_type => :error, :title => "hello, world")
      end


      btn.on_focus do
        puts "button hat jetzt focus"
      end

      btn.on_focus_lost do
        puts "button hat focus verloren"
      end
    end

    puts "text von testButton: #{frame[:testButton].text}"

    frame.size = java.awt.Dimension.new(200,200)

    options = ["Herr", "Frau", "Geek"]
    selected_value = Dialog.showOption(frame, options.join(" oder ") + "?", :option_values => options, :option_type => :yes_no_cancel)
    puts "#{selected_value} wurde ausgewählt"

    frame.visible = true
  end

  # dialog testen
  Dialog.new(nil, "mein titel", :modal => true) do |dial|
    Button.new("click me", :belongs_to => dial, :name => :clickButton) do |button|
      button.on_click do
        Dialog.show(nil, "test dialog", :dialog_type => :info, :title => "hey, was geht?")
      end
    end
    
    dial.size = java.awt.Dimension.new(300,300)
    dial.visible = true
  end
  
end