require_relative './tic_tac_toe/game'
require_relative './tic_tac_toe/player'
require_relative './tic_tac_toe/board'

# TicTacTeo Class
class TicTacToe
  attr_reader :game, :keep_playing, :turns

  def initialize
    @game = Game.new
    @keep_playing = true
    @turns = 0
  end

  def get_answer(answer)
    if answer == 'Y'
      game.play_turn
    elsif answer == 'N'
      @keep_playing = false
    end
  end
end

tic = TicTacToe.new
tic.game.setup_players
tic.game.play_turn
while tic.keep_playing
  puts 'Do you want to play again? Y or N'
  tic.get_answer(gets.chomp.upcase)
end
