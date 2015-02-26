class Printer

  def greeting
    puts "Welcome to Mastermind!"
  end

  def fancy_greeting                                              
    puts ",-.-.          |                   o         |"
    puts "| | |,---.,---.|--- ,---.,---.,-.-..,---.,---|"
    puts "| | |,---|`---.|    |---'|    | | |||   ||   |"
    puts "` ' '`---^`---'`---'`---'`    ` ' '``   '`---'"

    puts "\n"                                                                           
  end

  def menu
    puts "Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
    print ">"
  end

  def start_game
    puts "I have generated a beginner sequence with four elements made up of: (r)ed, (g)reen, (b)lue, and (y)ellow. Use (q)uit at any time to end the game.\nWhat's your guess?"
  end

  def play_again
    puts "Do you want to (p)lay again or (q)uit?"
    print ">"
  end

  def exit
    puts "Goodbye!"
  end

end