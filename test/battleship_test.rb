require './test/test_helper'
require './lib/battleship'

class BattleshipTest < Minitest::Test
  def test_place_two_ship_if_valid
    b = Battleship.new

    assert_instance_of Battleship, b
  end

  def test_two_ship_if_valid
    b = Battleship.new

    assert b.place_two_ship_if_valid('A1 A2')
  end

  def test_set_two_ship
    b = Battleship.new
    assert b.set_two_ship('A1 A2')
  end
end
