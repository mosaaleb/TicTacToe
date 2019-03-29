require_relative './tic_tac_toe/game'
require_relative './tic_tac_toe/player'
require_relative './tic_tac_toe/board'

# TicTacTeo Class
class TicTacToe
  attr_accessor :game, :keep_playing, :turns

  def initialize
    @game = Game.new
    @keep_playing = true
    @turns = 0
  end

  def play_turn
    game.board.reset_board
    while @turns < 9
      game.set_position
      if game.end_game?
        game.print_game_result
        break
      end
      game.swap_players
    end
    game.print_score
  end

  def get_answer(answer)
    if answer == 'Y' then play_turn
    elsif answer == 'N'
      @keep_playing = false
      exit
    else
      get_answer(answer)
    end
  end
end

tic = TicTacToe.new
tic.play_turn
while tic.keep_playing
  puts 'Do you want to play again? Y or N'
  tic.get_answer(gets.chomp.upcase)
end
