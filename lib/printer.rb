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
    puts "MASTERMIND is a game where you guess a sequence of colors in a certain order\nFor example, if the secret is rygb and you enter the guess of rrrr,\nyou have one color correct in one position.\nTry until you get the correct sequence!\nThe timer starts when you start the game!\nWould you like to (p)lay or (q)uit?"
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