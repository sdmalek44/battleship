require './test/test_helper'
require './lib/player'

class PlayerTest < Minitest::Test
  def test_it_exists
    player = Player.new

    assert_instance_of Player, player
  end

  def test_it_initializes_a_board
    player = Player.new

    assert_instance_of Board, player.board
  end
end
