require './test/test_helper'
require './lib/battleship'

class BattleshipTest < Minitest::Test
  def test_place_two_ship_if_valid
    b = Battleship.new

    assert_instance_of Battleship, b
  end

  def test_initializes_text_computer_player_class
    b = Battleship.new

    assert_instance_of Text, b.text
    assert_instance_of Computer, b.computer
    assert_instance_of Player, b.player
  end

  def test_turns_starts_at_zero
    b = Battleship.new

    assert_equal 0, b.turns
  end

  def test_end_game_is_false_initially
    b = Battleship.new

    refute b.end_game
  end

  def test_two_ship_if_valid
    b = Battleship.new

    assert b.place_two_ship_if_valid('A1 A2')
  end

  def test_set_two_ship
    b = Battleship.new
    assert b.set_two_ship('A1 A2')
  end

  def test_three_ship_if_valid
    b = Battleship.new

    assert b.place_three_ship_if_valid('A1 A3')
  end

  def test_set_three_ship
    b = Battleship.new
    assert b.set_three_ship('A1 A3')
  end

  def test_fire_if_possible
    b = Battleship.new

    assert_equal 'A1', b.fire_if_possible('A1')
  end

  def test_check_shot_result
    b = Battleship.new

    assert_nil b.check_shot_result('A1')
    b.computer.board.place_ship(['A2'])
    b.computer.board.shoot('A2')
    expected = b.computer.board.spaces['A'][2]
    actual = b.check_shot_result('A2')
    assert_equal expected, actual
  end

  def test_restart
    b = Battleship.new
    assert b.restart('R')
    assert b.end_game
  end

  def test_winning_shot
    b = Battleship.new

    refute b.winning_shot
    b.computer.board.add_hit
    b.computer.board.add_hit
    b.computer.board.add_hit
    b.computer.board.add_hit
    b.computer.board.add_hit
    assert b.winning_shot
  end

  def test_winning_shot
    b = Battleship.new

    refute b.losing_shot
    b.player.board.add_hit
    b.player.board.add_hit
    b.player.board.add_hit
    b.player.board.add_hit
    b.player.board.add_hit
    assert b.losing_shot
  end

  def test_add_turn
    b = Battleship.new

    assert_equal 0, b.turns
    assert_equal 1, b.add_turn
  end

  def test_finish_time
    b = Battleship.new

    b.start_time = 30
    assert_equal [0, 30], b.finish_time(60)
  end
end
