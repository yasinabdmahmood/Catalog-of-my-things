require 'colorize'

class Msg
  def success(msg)
    puts "\n#{'=' * msg.length}".green
    puts msg.green
    puts "#{'=' * msg.length}\n".green
  end

  def error(msg)
    puts "\n#{'=' * msg.length}".red
    puts msg.red
    puts "#{'=' * msg.length}\n".red
  end
end
