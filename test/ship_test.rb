require './lib/ship'
require './test/test_helper'

class ShipTest < Minitest::Test
  def test_it_exists
    s = Ship.new(2)

    assert_instance_of Ship, s
  end

  def test_it_sets_length
    s = Ship.new(2)

    assert_equal 2, s.length
  end

  def test_it_sets_health_equal_to_length
    s = Ship.new(2)

    assert_equal 2, s.health
  end

  def test_sunk_initializes_as_false
    s = Ship.new(2)

    refute s.sunk
  end

  def test_name_changes_depending_on_length
    s2 = Ship.new(2)
    s3 = Ship.new(3)

    assert_equal 'tugboat', s2.name
    assert_equal 'cruiser', s3.name
  end

  def test_hit_subtracts_health_if_not_sunk
    s = Ship.new(2)

    assert_equal 2, s.health

    s.hit
    refute s.sunk
    assert_equal 1, s.health
  end

  def test_sunk_changes_to_true_if_health_equals_zero
    s = Ship.new(2)
    
    assert_equal 2, s.health
    refute s.sunk

    s.hit
    s.hit

    assert_equal 0, s.health
    assert s.sunk
  end
end
