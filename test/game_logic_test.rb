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

  def test_it_cheats
    skip
    game = GameLogic.new
    sequence = game.generate
    assert_equal "BBGB", game.cheat
  end

  def test_it_wins
    mm = GameLogic.new
    sequence = mm.generate
    result = mm.execute(sequence)
    assert result.message.downcase.include?("win")
  end

end
