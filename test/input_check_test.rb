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
    invalid = InputCheck.new("X1 A2")

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

    refute valid.same?
    assert invalid.same?
  end

  def test_valid_letters
    valid = InputCheck.new("A1 B2")
    invalid = InputCheck.new("X1 A1")

    assert valid.valid_letters?
    refute invalid.valid_letters?
  end

  def test_right_letter
    i = InputCheck.new("A1 B2")

    assert i.right_letter?('A')
    refute i.right_letter?('X')
  end

  def test_valid_numbers
    valid = InputCheck.new("A1 B2")
    invalid = InputCheck.new("A5 B2")

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
end
