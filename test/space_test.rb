require './test/test_helper'
require './lib/space'
require './lib/ship'

class SpaceTest < Minitest::Test
  def test_if_it_exists
    s = Space.new

    assert_instance_of Space, s
  end

  def test_it_initializes_with_state
    s = Space.new

    assert_equal '~', s.state
  end

  def test_it_initializes_with_no_ship
    s = Space.new

    assert_nil s.ship
  end

  def test_it_creates_new_ship_if_ship_equals_nil
    space = Space.new
    ship = Ship.new(2)

    assert_instance_of Ship, space.fill(ship)
    assert_equal ship, space.ship
  end

  def test_it_changes_the_state_when_filled_and_shot_at
    space = Space.new
    ship = Ship.new(2)

    space.fill(ship)
    assert_equal 'H', space.shot
    assert_equal 'H', space.state
  end

  def test_it_changes_state_when_empty_and_shot_at
    space = Space.new

    assert_equal 'M', space.shot
    assert_equal 'M', space.state
  end

  def test_it_calls_hit_on_ship_subtracting_from_health
    space = Space.new
    ship = Ship.new(2)
    space.fill(ship)

    assert_equal 2, space.ship.health
    assert_equal 'H', space.shot

    assert_equal 1, space.ship.health
  end

  def test_it_changes_state_when_its_ship_is_sunk
    space = Space.new
    ship = Ship.new(2)
    space.fill(ship)
    space.shot
    space.shot

    assert space.ship.sunk
    assert_equal 'X', space.show_sunk
    assert_equal 'X', space.state
  end
end
