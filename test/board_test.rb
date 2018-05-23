require './test/test_helper'
require './lib/board'

class BoardTest < Minitest::Test
  def test_it_exists
    b = Board.new('comp')

    assert_instance_of Board, b
  end

  def test_spaces_initializes_a_hash_of_hashes_containing_space_objects
    b = Board.new('comp')

    assert_instance_of Space,b.spaces['A'][1]
    assert_instance_of Space,b.spaces['B'][2]
    assert_instance_of Space,b.spaces['C'][3]
    assert_instance_of Space,b.spaces['D'][4]
  end

  def test_get_numbers
    b = Board.new('comp')

    expected = [1, 2, 3]
    actual = b.get_numbers(['A1', 'A2', 'A3'])

    assert_equal expected, actual
  end

  def test_it_shoots_at_correct_position
    b = Board.new('comp')
    assert_nil b.spaces['A'][1].ship
    assert_nil b.spaces['A'][2].ship

    b.place_ship(['A1', 'A2'])

    assert_instance_of Ship, b.spaces['A'][1].ship
    assert_instance_of Ship, b.spaces['A'][2].ship
  end

  def test_get_letters
    b = Board.new('comp')

    expected = ['A', 'A', 'A']
    actual = b.get_letters(['A1', 'A2', 'A3'])

    assert_equal expected, actual
  end

  def test_it_places_ship_object
    b = Board.new('comp')

    b.place_ship(["A1", "A2"])
    expected = "tugboat"
    actual1 = b.spaces['A'][1].ship.name
    actual2 = b.spaces['A'][2].ship.name

    assert_equal expected, actual1
    assert_equal expected, actual2
  end

  def test_it_shoots_at_position
    b = Board.new('comp')

    b.shoot("A2")
    expected = "M"
    actual = b.spaces['A'][2].state

    assert_equal expected, actual
  end

  def test_add_hit_adds_one_to_hits
    b = Board.new('NAME')

    assert_equal 0, b.hits
    assert_equal 1, b.add_hit
    assert_equal 1, b.hits
  end

  def test_displays_board
    b = Board.new('NAME')
    actual = b.display
    expected = "\nNAME
==========
. 1 2 3 4
A ~ ~ ~ ~
B ~ ~ ~ ~
C ~ ~ ~ ~
D ~ ~ ~ ~
========="
    assert_equal expected, actual
  end
end
