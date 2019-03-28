require './tic_tac_toe/game'
require './tic_tac_toe/player'
require './tic_tac_toe/board'
# module TicTacToe
#   class Error < StandardError; end
#   # Your code goes here...
# end

game = Game.new

input = 'y'
while input == 'y'
  game.play
  puts 'Do you want to play again? Enter y or n'
  input = gets.chomp
end
