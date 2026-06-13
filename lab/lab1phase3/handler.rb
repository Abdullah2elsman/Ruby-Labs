# Shared interface every output must implement (I + D).
# Forces loud failure if a subclass forgets handle(event).
class Handler
  def handle(event)
    raise NotImplementedError, "#{self.class} must implement handle(event)"
  end
end
