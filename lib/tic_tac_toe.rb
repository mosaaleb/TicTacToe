require_relative './tic_tac_toe/game'
require_relative './tic_tac_toe/player'
require_relative './tic_tac_toe/board'

# TicTacTeo Class
class TicTacToe
  attr_accessor :game

  def initialize
    @game = Game.new
  end

  def play_turn
    game.board.reset_board
    i = 0
    while i < 9
      game.set_position
      if game.end_game?
        game.print_game_result
        break
      end
      game.swap_players
    end
  end

  def get_answer(answer)
    if answer == 'Y' then play_turn
    elsif answer == 'N'
      exit
    else
      get_answer(answer)
    end
  end
end

tic = TicTacToe.new

tic.play_turn
puts 'Do you want to play again? Y or N'
tic.get_answer(gets.chomp.upcase)
