require './lib/computer'
require './test/test_helper'

class ComputerTest < Minitest::Test
  def test_if_it_exists
    c = Computer.new

    assert_instance_of Computer, c
  end

  def test_it_initializes_a_board
    computer = Computer.new

    assert_instance_of Board, computer.board
  end

  def test_initializes_possible_shot_choices
    computer = Computer.new
    expected = %w[A1 A2 A3 A4 B1 B2 B3 B4 C1 C2 C3 C4 D1 D2 D3 D4]
    actual = computer.possible

    assert_equal expected, actual
  end

  def test_sets_up_ships_using_entered_arrays
    computer = Computer.new

    computer.set_up_ships(%w[A1 A2], %w[B2 B3 B4])

    assert_instance_of Ship, computer.board.spaces['A'][1].ship
    assert_equal 'tugboat', computer.board.spaces['A'][1].ship.name
    assert_instance_of Ship, computer.board.spaces['A'][2].ship
    assert_equal 'tugboat', computer.board.spaces['A'][2].ship.name
    assert_instance_of Ship, computer.board.spaces['B'][2].ship
    assert_equal 'cruiser', computer.board.spaces['B'][2].ship.name
    assert_instance_of Ship, computer.board.spaces['B'][3].ship
    assert_equal 'cruiser', computer.board.spaces['B'][3].ship.name
    assert_instance_of Ship, computer.board.spaces['B'][4].ship
    assert_equal 'cruiser', computer.board.spaces['B'][4].ship.name
  end

  def test_it_removes_guess_from_possible_guesses
    computer = Computer.new
    expected1 = %w[A1 A2 A3 A4 B1 B2 B3 B4 C1 C2 C3 C4 D1 D2 D3 D4]
    assert_equal expected1, computer.possible

    expected2 = %w[A2 A3 A4 B1 B2 B3 B4 C1 C2 C3 C4 D1 D2 D3 D4]
    computer.remove_guess('A1')
    assert_equal expected2, computer.possible
  end
end
