class MainMenu
  def printer
    @printer ||= Printer.new
  end

  def run
    play_again_response = false
    menu_response = ""
    until menu_response.include?("q")
      menu_response = gets.chomp
      if menu_response.include?("p")
        menu_response = game_loop
      else menu_response == "i"
        printer.instructions
      end
    end
    printer.exit
  end

  def game_loop
    printer.start_game
    game = GameLogic.new
    response = nil
    until response && response.status == :won
      print "> "
      input = gets.chomp
      response = game.execute(input)
      puts response.message
      if response.status == :won
        printer.play_again
        play_again_input = gets.chomp
        if play_again_input.include?("p")
          printer.menu
          return "p"
        else
          return "q"
        end
      elsif response.status == :quit
        printer.menu
        return ""
      end
    end
  end

end