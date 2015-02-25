require './lib/game_logic'
require './lib/printer'
require './lib/main_menu'

printer = Printer.new

printer.greeting
printer.menu

main_menu = true
play_again_response = false

until main_menu == false

  menu_response = gets.chomp

  if menu_response.include?("p")
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
          main_menu = true
          printer.menu
          break
        else
          main_menu = false
          printer.exit
          break
        end
      elsif response.status == :quit
        printer.menu
        break
      end
    end

  elsif menu_response.include?("q")
    printer.exit
    main_menu = false
  end

end
