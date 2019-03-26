require_relative 'tic_tac_toe'

new_game = TicTacToe.new
sleep(0.5)
new_game.generate_players
new_game.play
