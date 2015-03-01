class MainMenu
  def printer
    @printer ||= Printer.new
  end

  def game_loop
    @game_loop ||= GameLoop.new(printer, self)
  end

  def run
    printer.menu
    menu_response = gets.chomp
    if menu_response.include?("p")
      game_loop.run
    elsif menu_response == "i"
      printer.instructions
      run
    elsif menu_response.include?("q")
      quit
    end
  end

  def quit
    printer.exit
  end


end