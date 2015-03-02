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

  def test_sequence_is_four_characters
    game = GameLogic.new
    sequence = game.generate
    assert_equal 4, sequence.length
  end

  def test_sequence_is_a_string
    game = GameLogic.new
    sequence = game.generate
    assert_equal String, sequence.class
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

  def test_it_can_count_4_matching_characters
    game = GameLogic.new
    input = "gybr"
    game.secret = "ygrb"
    assert_equal 4, game.number_of_matching_characters(game.secret, input)
  end

  def test_it_increments_a_turn
    game = GameLogic.new
    game.increment_turn
    assert_equal 1, game.turns
  end

  def test_inputs_of_one_character_are_too_short
    game = GameLogic.new
    assert game.execute("r").message.include?("too short")
  end

  def test_inputs_of_two_characters_are_too_short
    game = GameLogic.new
    assert game.execute("rr").message.include?("too short")
  end

  def test_inputs_of_five_characters_are_too_long
    game = GameLogic.new
    assert game.execute("rrrrr").message.include?("too long")
  end

  def test_inputs_of_six_characters_are_too_long
    game = GameLogic.new
    assert game.execute("rrrrrb").message.include?("too long")
  end

  def test_it_can_cheat
    game = GameLogic.new
    assert_equal game.secret, game.execute("c").message
  end

  def test_it_can_win
    game = GameLogic.new
    assert game.execute("#{game.secret}").message.include?("Congratulations!")
  end

  def test_it_can_quit
    game = GameLogic.new
    assert game.execute("q").message.include?("Game quit")
  end

end

