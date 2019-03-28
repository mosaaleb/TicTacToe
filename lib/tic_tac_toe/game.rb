require_relative 'player'
require_relative 'board'

# game class
class Game
  WINNING_COMBINATION = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6],
                         [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]].freeze
  attr_accessor :board, :st_player, :nd_player
  def initialize
    @board = Board.new
    puts 'Enter first player name'
    @st_player = Player.new(gets.chomp)
    puts 'Enter second player name'
    @nd_player = Player.new(gets.chomp)
  end

  def print_score
    puts "#{@st_player.name}:#{@st_player.score}
    \nVS\n#{@nd_player.name}:#{@nd_player.score}\n"
  end

  def game_draw?
    @board.board_full? && !game_won?
  end

  def game_won?
    WINNING_COMBINATION.each do |item|
      return true if @board.get_cell(item[0]) == @board.get_cell(item[1]) &&
                     @board.get_cell(item[1]) == @board.get_cell(item[2]) &&
                     @board.get_cell(item[0]) != '_'
    end
    false
  end
end
