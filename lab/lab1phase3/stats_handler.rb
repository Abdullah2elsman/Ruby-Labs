require_relative "handler"

# Collects stats silently per event; prints summary at_exit (S + O).
# Fires automatically on exit — the menu never calls it directly.
class StatsHandler < Handler
  def initialize
    @counts   = Hash.new(0)
    @minutes  = Hash.new(0)

    # Fires automatically when the program exits (O — menu is untouched)
    at_exit { print_summary }
  end

  def handle(event)
    @counts[event.type]  += 1
    @minutes[event.type] += event.duration.to_i
  end

  private

  def print_summary
    return if @counts.empty?

    puts "\n============================================"
    puts "           SESSION STATISTICS"
    puts "============================================"
    puts "#{"Type".ljust(15)} #{"Sessions".ljust(12)} #{"Total Min".ljust(10)}"
    puts "--------------------------------------------"

    @counts.each do |type, count|
      puts "#{type.ljust(15)} #{count.to_s.ljust(12)} #{@minutes[type]}"
    end

    total_sessions = @counts.values.sum
    total_minutes  = @minutes.values.sum
    puts "--------------------------------------------"
    puts "#{"TOTAL".ljust(15)} #{total_sessions.to_s.ljust(12)} #{total_minutes}"
    puts "============================================"
  end
end
