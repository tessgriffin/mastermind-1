require_relative 'response'

class GameLogic
  attr_reader :secret, :spot_count, :element_count

  def generate
    array = ["r", "g", "b", "y"]
    secret = array.map do |char|
      rand = rand(0..3)
      array[rand]
    end
    secret.join
  end

  def initialize
    @secret = generate
  end

  def position_matching(input)
    @spot_count = 0
    input_array = input.chars
    results = @secret.chars.zip(input_array)
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
    array_of_colors = ["r", "g", "b", "y"]
    @element_count = 0
    difference = 0
    input_array = input.chars
    secret_array = @secret.chars
    secret_count = array_of_colors.map do |color|
      secret_array.count(color)
    end
    input_count = array_of_colors.map do |color|
      input_array.count(color)
    end
    print secret_count
    print input_count

  end

  def number_of_matching_characters(secret, input)
    secret.chars.sort.each_with_index.count do |char, i|
      char == input.chars.sort[i]
    end
  end


  def execute(input)
    position = position_matching(input)
    matching_elements = number_of_matching_characters(@secret, input)
    if input == @secret
      Response.new(:message => "You Win!", :status => :won)
    elsif input == "c"
      Response.new(:message => "#{@secret}", :status => :continue)
    elsif input == "q"
      Response.new(:message => "Game quit", :status => :won)
    else 
      Response.new(:message => "'#{input}' has #{matching_elements} matching elements at #{position} correct positions", :status => :continue)
    end
  end
end


#game = GameLogic.new
#print game.number_of_matching_characters("bbry", "ybrb")
#puts game.secret.join
#puts game.position_matching("rrrr")


#class Game
#  def initialize(random_answer_generator)
#    @random_answer_generator = random_answer_generator
#  end
#end

#class FakeAnswerGenerator
#  def initialize(known_answer)
#    @known_answer = known_answer
#  end

#  def generate_random_answer
#    @known_answer
#  end
#end

#class RealAnswerGenerator
#  def generate_random_answer
    # I don't know you figure it out
#  end
#end


#Game.new(FakeAnswerGenerator.new("RRGYB"))
