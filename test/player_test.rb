require './test/test_helper'
require './lib/player'

class PlayerTest < Minitest::Test
  def test_it_exists
    player = Player.new

    assert_instance_of Player, player
  end

  def test_it_initializes_a_board
    player = Player.new

    assert_instance_of Board, player.board
  end

  def test_initializes_possible_shot_choices
    player = Player.new
    expected = %w[A1 A2 A3 A4 B1 B2 B3 B4 C1 C2 C3 C4 D1 D2 D3 D4]
    actual = player.possible

    assert_equal expected, actual
  end

  def test_initializes_check_class_for_input_validation
    player = Player.new

    assert_instance_of Check, player.chk
  end

  def test_enter_two_ship_stores_array_of_points_in_ship_locations
    player = Player.new
    player.enter_two_ship('A1 A2')
    refute player.enter_two_ship('A1 A3')

    assert_equal [['A1', 'A2']], player.ship_locations
  end

  def test_enter_two_ships_adds_to_fill_locations
    player = Player.new

    player.enter_two_ship('A1 A2')

    assert_equal ['A1','A2'], player.filled_spots
  end

  def test_enter_three_ship_adds_array_of_3_to_ship_locations
    player = Player.new

    player.enter_two_ship('A1 A2')
    player.enter_three_ship('B2 B4')
    refute player.enter_three_ship('A1 A2')

    expected = [['A1', 'A2'], ['B2', 'B3', 'B4']]
    actual = player.ship_locations

    assert_equal expected, actual
  end

  def test_enter_three_changes_and_returns_flattened_array_of_filled_spots
    player = Player.new

    player.enter_two_ship('A1 A2')
    player.enter_three_ship('B2 B4')

    expected = ['A1', 'A2', 'B2', 'B3', 'B4']
    actual = player.filled_spots

    assert_equal expected, actual
  end

  def test_array_of_ship_points_doesnt_overlap_with_already_placed_ships
    player = Player.new

    player.enter_two_ship('A1 A2')

    assert player.no_overlap('A3 A4')
    refute player.no_overlap('A2 B2')
  end
end
