module TestHelper
  def should_have_events(component_events_hash)
    component = component_events_hash.keys.first
    events = component_events_hash[component]
    events.each do |event|
      assert(component.respond_to?(event), "no #{event} event-method available!")
    end
  end
end