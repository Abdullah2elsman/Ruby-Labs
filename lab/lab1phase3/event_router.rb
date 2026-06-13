require_relative "handler"

# Notifies every registered handler when an event fires (Observer).
# Never references any concrete handler by name (D).
class EventRouter
  def initialize
    @handlers = []
  end

  def register(handler)
    raise ArgumentError, "Must be a Handler" unless handler.is_a?(Handler)
    @handlers << handler
  end

  def dispatch(event)
    @handlers.each { |h| h.handle(event) }
  end
end
