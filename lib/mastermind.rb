require './lib/game_logic'

puts "Welcome to Mastermind"
puts "Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
print ">"

initial_response = gets.chomp

if initial_response.include?("p")
  puts "I have generated a beginner sequence with four elements made up of: (r)ed, (g)reen, (b)lue, and (y)ellow. Use (q)uit at any time to end the game.\nWhat's your guess?"
  game = GameLogic.new
  response = nil
  until response && response.status == :won
    print "> "
    input = gets.chomp
    response = game.execute(input)
    puts response.message
  end

elsif initial_response.include?("q")
  puts "Goodbye!"
end

