require_relative "handler"

# Appends each event to a log file. Nothing else (S).
class FileHandler < Handler
  LOG_FILE = "lifetrack.log"

  def handle(event)
    File.open(LOG_FILE, "a") do |f|
      f.puts event.to_s
    end
  end
end
