class GameLoop

  def initialize(printer, main_menu)
    @printer = printer
    @main_menu = main_menu
  end

  def run
    printer.start_game
    game = GameLogic.new
    response = nil
    catch(:quit) do
      until response && response.status == :won
        printer.print_carrot
        input = gets.chomp
        evaluate_guess(input, game)
      end
    end
  end

  def evaluate_guess(input, game)
    response = game.execute(input)
    puts response.message
    if response.status == :won
      play_again
    elsif response.status == :quit
      quit_to_menu
    end
  end

  def quit_to_menu
    main_menu.run
    throw(:quit)
  end

  def play_again
    printer.play_again
    play_again_input = gets.chomp
    if play_again_input.include?("r")
      main_menu.run
      throw(:quit)
    else
      main_menu.quit
      throw(:quit)
    end
  end

  protected

  attr_reader :printer, :main_menu
  
end