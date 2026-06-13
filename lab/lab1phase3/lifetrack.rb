require_relative "life_event"
require_relative "event_router"
require_relative "console_handler"
require_relative "file_handler"
require_relative "stats_handler"

# ── Wiring (only place that knows concrete classes) ──────────────────
router = EventRouter.new
router.register(ConsoleHandler.new)
router.register(FileHandler.new)
router.register(StatsHandler.new)   # stats print automatically at_exit

# ── Menu helpers ─────────────────────────────────────────────────────
MENU = {
  "1" => "WORK",
  "2" => "STUDY",
  "3" => "EXERCISE",
  "4" => "MEAL"
}.freeze

def prompt(label)
  print "#{label}: "
  gets.chomp
end

# ── Main loop ────────────────────────────────────────────────────────
loop do
  puts "\n=== LifeTrack ==="
  puts "1. Log a work session"
  puts "2. Log a study session"
  puts "3. Log an exercise session"
  puts "4. Log a meal"
  puts "5. Exit"
  print "\nChoose an option: "

  choice = gets.chomp

  break if choice == "5"

  unless MENU.key?(choice)
    puts "Invalid option. Please choose 1–5."
    next
  end

  type        = MENU[choice]
  description = prompt("Description")
  duration    = prompt("Duration (minutes)")

  event = LifeEvent.new(type: type, description: description, duration: duration)
  router.dispatch(event)
end

puts "\nGoodbye! See you next session."
