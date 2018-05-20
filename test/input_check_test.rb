require './test/test_helper'
require './lib/input_check'

class InputCheckTest < Minitest::Test
  def test_it_exists
    i = InputCheck.new("A1 B2")

    assert_instance_of InputCheck, i
  end

  def test_input_is_assigned
    i = InputCheck.new("A1 B2")

    assert_equal "A1 B2", i.input
  end

  def test_it_can_split
    valid = InputCheck.new("A1 B2")
    invalid = InputCheck.new("abc")

    assert valid.split?
    refute invalid.split?

    assert_equal ["A1", "B2"], valid.input_arr
  end

  def test_valid_format
    valid = InputCheck.new("A1 B2")
    invalid = InputCheck.new("abcde")


    assert valid.valid_format?
    refute invalid.valid_format?
  end

  def test_if_same
    valid = InputCheck.new("A1 B2")
    invalid = InputCheck.new("A1 A1")
    valid.split?
    invalid.split?

    refute valid.same?
    assert invalid.same?
  end

  def test_valid_letters
    valid = InputCheck.new("A1 B2")
    invalid = InputCheck.new("X1 A1")
    valid.split?
    invalid.split?

    assert valid.valid_letters?
    refute invalid.valid_letters?
  end

  def test_letters
    i = InputCheck.new("A1 B2")

    assert_equal ['A', 'B', 'C', 'D'], i.letters
  end

  def test_valid_numbers
    valid = InputCheck.new("A1 B2")
    invalid = InputCheck.new("A5 B2")
    valid.split?
    invalid.split?

    assert valid.valid_numbers?
    refute invalid.valid_numbers?
  end

  def test_get_numbers_and_get_letters
    valid = InputCheck.new("A1 A2")

    valid.split?

    assert_equal ["A","A"], valid.get_letters
    assert_equal [1, 2], valid.get_numbers
  end

  def test_points_are_in_same_row
    row = InputCheck.new("A1 A2")
    row.split?

    assert row.same_row?
    refute row.same_col?
  end

  def test_points_are_in_same_column
    column = InputCheck.new("A1 B1")
    column.split?

    assert column.same_col?
    refute column.same_row?
  end

  def test_its_not_diagonal
    valid = InputCheck.new("A1 A2")
    invalid = InputCheck.new("A2 B1")

    valid.split?
    invalid.split?

    assert valid.not_diagonal?
    refute invalid.not_diagonal?
  end

  def test_if_input_range_too_long
    long1 = InputCheck.new("A1 D1")
    long2 = InputCheck.new("A1 B4")
    valid = InputCheck.new("A1 C1")
    long1.split?
    long2.split?
    valid.split?

    refute long1.right_length?
    refute long2.right_length?
    assert valid.right_length?
  end

  def test_if_input_is_valid
    invalid = InputCheck.new("A9 A1")
    invalid2 = InputCheck.new("A1 B4")
    valid1 = InputCheck.new("A1 C1")
    valid2 = InputCheck.new("B1 B2")

    refute invalid.valid?
    refute invalid2.valid?
    assert valid1.valid?
    assert valid2.valid?
  end

  def test_it_expands
    valid1 = InputCheck.new("A1 C1")
    valid2 = InputCheck.new("B1 B3")
    assert valid1.valid?
    assert valid2.valid?

    assert_equal ["A1", "B1", "C1"], valid1.expand
    assert_equal ["B1", "B2", "B3"], valid2.expand
  end

  def test_expands_if_valid_and_changes_output
    valid1 = InputCheck.new("A1 C1")
    valid2 = InputCheck.new("B1 B3")
    invalid = InputCheck.new("X1 B3")

    assert_equal ["A1", "B1", "C1"], valid1.expand_if_valid
    assert_equal ["B1", "B2", "B3"], valid2.expand_if_valid
    refute invalid.expand_if_valid

    assert_equal ["A1", "B1", "C1"], valid1.output
    assert_equal ["B1", "B2", "B3"], valid2.output
  end

end
