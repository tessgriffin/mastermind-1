class MainMenu
  def printer
    @printer ||= Printer.new
  end

  def run
    printer.menu
    menu_response = gets.chomp
    if menu_response.include?("p")
      game_loop
    elsif menu_response == "i"
      printer.instructions
      run
    elsif menu_response.include?("q")
      quit
    end
  end

  def game_loop
    printer.start_game
    game = GameLogic.new
    response = nil
    catch(:quit) do
      until response && response.status == :won
        printer.print_carrot
        input = gets.chomp
        response = game.execute(input)
        puts response.message
        if response.status == :won
          printer.play_again
          play_again_input = gets.chomp
          if play_again_input.include?("r")
            run
          else
            quit
          end
        elsif response.status == :quit
          run
          throw(:quit)
        end
      end
    end
  end

  private

  def quit
    printer.exit
  end
end