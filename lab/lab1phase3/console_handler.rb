require_relative "handler"

# Prints each event to the terminal. Nothing else (S).
class ConsoleHandler < Handler
  def handle(event)
    puts "\n#{event}"
    puts "✓ Event logged."
  end
end
