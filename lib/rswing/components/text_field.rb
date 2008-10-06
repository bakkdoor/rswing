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