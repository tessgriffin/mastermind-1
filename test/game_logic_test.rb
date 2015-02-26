require 'minitest/autorun'
require 'minitest/pride'
require './lib/game_logic'

class GameLogicTest < Minitest::Test
  def test_it_exists
    assert GameLogic
  end

  def test_it_can_generate_a_sequence
    game = GameLogic.new
    sequence = game.generate
    refute_equal nil, sequence
  end

  def test_it_can_count_matching_positions
    game = GameLogic.new
    input = "rrrr"
    game.secret = "rbbb"
    assert_equal 1, game.position_matching(input)
  end

  def test_it_can_count_zero_matching_positions
    game = GameLogic.new
    input = "rrrr"
    game.secret = "bbbb"
    assert_equal 0, game.position_matching(input)
  end

  def test_it_can_count_three_matching_positions
    game = GameLogic.new
    input = "byrb"
    game.secret = "byry"
    assert_equal 3, game.position_matching(input)
  end

  def test_it_can_count_matching_characters
    game = GameLogic.new
    input = "rrrr"
    game.secret = "rrbb"
    assert_equal 2, game.number_of_matching_characters(game.secret, input)
  end

  def test_it_can_count_0_matching_characters
    game = GameLogic.new
    input = "bbbb"
    game.secret = "yyyy"
    assert_equal 0, game.number_of_matching_characters(game.secret, input)
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