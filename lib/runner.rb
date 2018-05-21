require './lib/battleship'

loop do
  b = Battleship.new

  b.start_game
  b.place_computer_ships
  b.place_first_ship
  b.place_second_ship
  b.player.set_up_ships

  loop do
    b.player_fires
    break if b.end_game
    b.computer.board.display
    b.end_turn

    b.computer_fires
    break if b.end_game
    b.player.board.display
    b.end_opposing_turn
  end
end
