Gem::Specification.new do |s|
  s.name = %q{rswing}
  s.version = "0.2.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.2") if s.respond_to? :required_rubygems_version=
  s.authors = ["Christopher Bertels"]
  s.date = %q{2008-11-13}
  s.description = %q{RSwing is a wrapper of the Swing GUI-Framework of the Java Platform for JRuby. The goal is to provide a ruby-ish wrapper library to Swing, which makes it feel more like an actual ruby library rather than just a plain interface to the java classes.}
  s.email = %q{bakkdoor@flasht.de}
  s.extra_rdoc_files = ["lib/rswing/components/button.rb", "lib/rswing/components/check_box.rb", "lib/rswing/components/combo_box.rb", "lib/rswing/components/component.rb", "lib/rswing/components/container.rb", "lib/rswing/components/dialog.rb", "lib/rswing/components/events/button_events.rb", "lib/rswing/components/events/component_events.rb", "lib/rswing/components/events/container_events.rb", "lib/rswing/components/events/event.rb", "lib/rswing/components/events/focus_events.rb", "lib/rswing/components/events/hierarchy_bounds_events.rb", "lib/rswing/components/events/hierarchy_changed.rb", "lib/rswing/components/events/input_method_events.rb", "lib/rswing/components/events/key_events.rb", "lib/rswing/components/events/mouse_events.rb", "lib/rswing/components/events/mouse_motion_events.rb", "lib/rswing/components/events/mouse_wheel_events.rb", "lib/rswing/components/events/property_changed.rb", "lib/rswing/components/events/window_events.rb", "lib/rswing/components/events/window_focus.rb", "lib/rswing/components/events/window_state.rb", "lib/rswing/components/frame.rb", "lib/rswing/components/listener.rb", "lib/rswing/components/options.rb", "lib/rswing/components/panel.rb", "lib/rswing/components/text_field.rb", "lib/rswing/components/window.rb", "lib/rswing.rb", "LICENSE", "README"]
  s.files = ["examples/combobox_example.rb", "examples/numberconverter.rb", "lib/rswing/components/button.rb", "lib/rswing/components/check_box.rb", "lib/rswing/components/combo_box.rb", "lib/rswing/components/component.rb", "lib/rswing/components/container.rb", "lib/rswing/components/dialog.rb", "lib/rswing/components/events/button_events.rb", "lib/rswing/components/events/component_events.rb", "lib/rswing/components/events/container_events.rb", "lib/rswing/components/events/event.rb", "lib/rswing/components/events/focus_events.rb", "lib/rswing/components/events/hierarchy_bounds_events.rb", "lib/rswing/components/events/hierarchy_changed.rb", "lib/rswing/components/events/input_method_events.rb", "lib/rswing/components/events/key_events.rb", "lib/rswing/components/events/mouse_events.rb", "lib/rswing/components/events/mouse_motion_events.rb", "lib/rswing/components/events/mouse_wheel_events.rb", "lib/rswing/components/events/property_changed.rb", "lib/rswing/components/events/window_events.rb", "lib/rswing/components/events/window_focus.rb", "lib/rswing/components/events/window_state.rb", "lib/rswing/components/frame.rb", "lib/rswing/components/listener.rb", "lib/rswing/components/options.rb", "lib/rswing/components/panel.rb", "lib/rswing/components/text_field.rb", "lib/rswing/components/window.rb", "lib/rswing.rb", "LICENSE", "Manifest", "Rakefile", "README", "test/test_button.rb", "test/test_container.rb", "test/test_helper.rb", "rswing.gemspec"]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/bakkdoor/rswing}
  s.rdoc_options = ["--line-numbers", "--inline-source", "--title", "Rswing", "--main", "README"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{rswing}
  s.rubygems_version = %q{1.2.0}
  s.summary = %q{RSwing - Ruby-ish wrapper of Swing GUI-Framework for JRuby}
  s.test_files = ["test/test_button.rb", "test/test_container.rb", "test/test_helper.rb"]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if current_version >= 3 then
    else
    end
  else
  end
end
