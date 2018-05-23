require './test/test_helper'
require './lib/check'

class CheckTest < Minitest::Test
  def test_it_exists
    c = Check.new

    assert_instance_of Check, c
  end

  def test_valid_format
    valid = Check.new
    invalid = Check.new

    assert valid.valid_form("A1 B2")
    refute invalid.valid_form("abcde")
  end

  def test_valid_letters
    valid = Check.new
    invalid = Check.new

    assert valid.valid_letts("A1 B2")
    refute invalid.valid_letts("X1 A1")
  end

  def test_returns_possible_letters
      c = Check.new

      assert_equal %w[A B C D], c.letters
  end

  def test_valid_numbers
    valid = Check.new
    invalid = Check.new

    assert valid.valid_nums("A1 B2")
    refute invalid.valid_nums("A5 B2")
  end

  def test_right_num?
    c = Check.new

    assert c.right_num?(3)
    refute c.right_num?(5)
  end

  def test_get_letters
    c = Check.new
    expected = ['A', 'B']
    actual = c.get_letts('A1 B4')

    assert_equal expected, actual
  end

  def test_get_numbers
    c = Check.new
    expected = [1, 2]
    actual = c.get_nums('A1 A2')

    assert_equal expected, actual
  end

  def test_points_are_in_same_row
    c = Check.new

    assert c.same_row("A1 A2")
    refute c.same_col("A1 A2")
  end

  def test_points_are_in_same_column
    c = Check.new

    assert c.same_col("A1 B1")
    refute c.same_row("A1 B1")
  end

  def test_if_it_expands_a_three_ship
    valid1 = Check.new
    valid2 = Check.new

    assert_equal ["A1", "B1", "C1"], valid1.expand("A1 C1")
    assert_equal ["B1", "B2", "B3"], valid2.expand("B1 B3")
  end
end
