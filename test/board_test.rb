require './test/test_helper'
require './lib/board'

class BoardTest < Minitest::Test
  def test_it_exists
    b = Board.new

    assert_instance_of Board, b
  end

  def test_get_numbers
    b = Board.new

    expected = [1, 2, 3]
    actual = b.get_numbers(['A1', 'A2', 'A3'])

    assert_equal expected, actual
  end

  def test_get_letters
    b = Board.new

    expected = ['A', 'B', 'C']
    actual = b.get_letters(['A1', 'A2', 'A3'])
  end

  def test_it_places_ship_object
    b = Board.new

    b.place_ship(["A1", "A2"])
    expected = "tugboat"
    actual1 = b.spaces['A'][1].ship.name
    actual2 = b.spaces['A'][2].ship.name

    assert_equal expected, actual1
    assert_equal expected, actual2
  end
end
