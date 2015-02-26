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

  def test_it_can_count_matching_characters
    game = GameLogic.new
    input = "rrrr"
    game.secret = "rrbb"
    assert_equal 2, game.number_of_matching_characters(game.secret, input)

  end

end
