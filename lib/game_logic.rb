require_relative 'response'

class GameLogic
  attr_reader :secret, :spot_count

  def generate
    array = ["r", "g", "b", "y"]
    secret = array.map do |char|
      rand = rand(0..3)
      array[rand]
    end
    secret
  end

  def initialize
    @secret = generate
  end

  def position_matching(input)
    @spot_count = 0
    input_array = input.chars
    results = @secret.zip(input_array)
    results.map do |result|
      if result[0] == result[1]
        @spot_count += 1
      end
    end
    @spot_count
  end

#  def cheat
#    print @secret.join
#  end

#loop through the guess array
#if answer.include g
#match = answer.find_index(g)
#match = nil this deletes the match
#count += 1

  def match_elements(input)
    match = nil
    count = 0
    secret = "rrgb"
    input_array = input.split
    input_array.each do |input|
      if secret.include? input
        match = secret.find_index(input)
        match = nil
        count += 1
      end
    end
    count
  end


  def execute(input)
    if input == @secret.join
      Response.new(:message => "You Win!", :status => :won)
    elsif input == "c"
      Response.new(:message => "#{@secret.join}", :status => :continue)
    elsif input == "q"
      Response.new(:message => "Game quit", :status => :won)
    else
      Response.new(:message => "Guess again!", :status => :continue)
    end
  end
end


game = GameLogic.new
puts game.secret.join
puts game.position_matching("rrrr")
