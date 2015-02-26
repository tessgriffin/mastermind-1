require_relative 'response'

class GameLogic
  attr_reader :spot_count, :element_count, :turns, :game_time
  attr_accessor :secret

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
    @turns = 0
    @game_time = Time.now
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
    grouped_elements(secret).each.reduce(0) do |sum, (element, usages)|
      input_group = grouped_elements(input)[element] || []
      sum + [usages.size, input_group.size].min
    end
  end

#returns a hash where the key is the character, and value is an array with each entry being the times it appears
#in sequence. For example r => [r, r, r]
  def grouped_elements(str)
    str.chars.group_by(&:itself)
  end

  def execute(input)
    position = position_matching(input)
    matching_elements = number_of_matching_characters(@secret, input)
    if input == @secret
      @turns += 1
      total_time_in_seconds = Time.now - @game_time
      game_time_seconds = (total_time_in_seconds % 60).to_i
      game_time_minutes = (total_time_in_seconds / 60).to_i
      Response.new(:message => "Congratulations! You guessed the sequence '#{@secret}' in #{@turns} guesses in #{game_time_minutes} minutes and #{game_time_seconds} seconds", :status => :won)
    elsif input == "c"
      Response.new(:message => "#{@secret}", :status => :continue)
    elsif input == "q"
      Response.new(:message => "Game quit", :status => :quit)
    else 
      @turns += 1
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
