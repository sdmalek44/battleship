require './test/test_helper'
require './lib/player'

class PlayerTest < Minitest::Test
  def test_two_or_three
    player = Player.new

    assert_equal 3, player.two_or_three(input)
  end
end
