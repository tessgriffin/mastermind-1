require './lib/game_logic'
require './lib/printer'
require './lib/main_menu'

printer = Printer.new

printer.greeting
printer.fancy_greeting

MainMenu.new.run
