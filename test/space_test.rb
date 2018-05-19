require './test/test_helper'
require './lib/space'

class SpaceTest < Minitest::Test
  def test_row_column_position
    s = Space.new("A", 3)

    assert_equal "A", s.row
    assert_equal 3, s.col
    assert_equal "A3", s.name
  end

end
