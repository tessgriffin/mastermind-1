require 'colorize'

class Printer

  def greeting
    puts "Welcome to Mastermind!"
  end

  def fancy_greeting                                              
    puts ",-.-.          |                   o         |".red
    puts "| | |,---.,---.|--- ,---.,---.,-.-..,---.,---|".green
    puts "| | |,---|`---.|    |---'|    | | |||   ||   |".blue
    puts "` ' '`---^`---'`---'`---'`    ` ' '``   '`---'".yellow

    puts "\n"                                                                           
  end

  def menu
    puts "Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
    print_carrot
  end

  def instructions
    puts <<-INSTRUCTIONS
MASTERMIND is a game where you guess a sequence of colors in a certain order
For example, if the secret is rygb and you enter the guess of rrrr,
you have one color correct in one position.
Try until you get the correct sequence!
The timer starts when you start the game!
    INSTRUCTIONS
    print_carrot

  end

  def start_game
    puts "I have generated a beginner sequence with four elements made up of: (r)ed, (g)reen, (b)lue, and (y)ellow. Use (q)uit at any time to end the game.\nWhat's your guess?"
  end

  def play_again
    puts "Do you want to (r)eturn to the main menu or (q)uit?"
    print_carrot
  end

  def exit
    puts "Goodbye!"
  end

  def print_carrot
    print "> "
  end

end