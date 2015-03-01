require_relative 'response'

class GameLogic
  attr_reader :position, :matching_elements, :turns, :start_time, :end_time
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
    @start_time = Time.now
  end

  def position_matching(input)
    @position = 0
    input_array = input.chars
    results = @secret.chars.zip(input_array)
    results.map do |result|
      if result[0] == result[1]
        @position += 1
      end
    end
    @position
  end

#returns a hash where the key is the character, and value is an array with each entry being the times it appears
#in sequence. For example r => [r, r, r]
  def grouped_elements(str)
    str.chars.group_by(&:itself)
  end

  def number_of_matching_characters(secret, input)
    grouped_elements(secret).each.reduce(0) do |sum, (element, usages)|
      input_group = grouped_elements(input)[element] || []
      sum + [usages.size, input_group.size].min
    end
  end

  def stop_tracking_time
    @end_time = Time.now
  end

  def elapsed_time
    total_time_in_seconds = end_time - start_time
    game_seconds = (total_time_in_seconds % 60).to_i
    game_minutes = (total_time_in_seconds / 60).to_i
    "#{game_minutes} minutes, #{game_seconds} seconds"
  end

  def increment_turn
    @turns += 1
  end

  def execute(input)
    parse_input(input)
    if input == @secret
      winning_guess
    elsif input == "c"
      cheat
    elsif input == "q"
      quit_in_game
    elsif input.size != 4
      incorrect_size(input) 
    else 
      incorrect_guess(input)
    end
  end

  private

  def parse_input(input)
    input = input.downcase
    position = position_matching(input)
    @matching_elements = number_of_matching_characters(@secret, input)
  end

  def winning_guess
    increment_turn
    stop_tracking_time
    Response.new(:message => "Congratulations! You guessed the sequence '#{@secret}' in #{@turns} guesses in #{elapsed_time}", :status => :won)
  end

  def incorrect_guess(input)
    increment_turn
    Response.new(:message => "'#{input}' has #{matching_elements} matching elements at #{position} correct positions", :status => :continue)
  end

  def incorrect_size(input)
    if input.size > 4
      Response.new(:message => "Your guess is too long", :status => :continue)
    elsif input.size < 4
      Response.new(:message => "Your guess is too short", :status => :continue)
    end
  end

  def quit_in_game
    Response.new(:message => "Game quit, returning to main menu", :status => :quit)
  end

  def cheat
    Response.new(:message => "#{@secret}", :status => :continue)
  end



end

