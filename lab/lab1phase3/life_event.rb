# Carries all data for a single life event.
# No output logic — just data (S).
class LifeEvent
  attr_reader :type, :description, :duration, :timestamp

  def initialize(type:, description:, duration:)
    @type        = type
    @description = description
    @duration    = duration
    @timestamp   = Time.now
  end

  def to_s
    "[#{timestamp.strftime('%Y-%m-%d %H:%M')}] #{type} — #{description} (#{duration} min)"
  end
end
