require './lib/battleship'

b = Battleship.new

b.start_game

b.place_computer_ships

b.place_first_ship

b.place_second_ship

b.player.set_up_ships

b.computer.board.display
b.fire_on_position
