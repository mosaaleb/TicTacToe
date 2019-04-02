require_relative 'player'
require_relative 'board'

# game class
class Game
  WINNING_COMBINATION = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6],
                         [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]].freeze
  attr_accessor :board, :st_player, :nd_player, :current_player
  def initialize
    @board = Board.new
    @turns = 0
    setup_players
  end

  def setup_players
    puts 'Enter first player name'
    @st_player = Player.new(gets.chomp)
    puts 'Enter second player name'
    @nd_player = Player.new(gets.chomp)
    @current_player = @st_player
    @st_player.sym = 'X'
    @nd_player.sym = 'O'
  end

  def print_score
    puts '==========='
    puts "#{@st_player.name}:#{@st_player.score}"
    puts '  VS  '
    puts "#{@nd_player.name}:#{@nd_player.score}"
    puts '==========='
  end

  def game_draw?
    @board.board_full? && !game_won?
  end

  def game_won?
    WINNING_COMBINATION.each do |item|
      return true if @board.get_cell(item[0]) == @board.get_cell(item[1]) &&
                     @board.get_cell(item[1]) == @board.get_cell(item[2]) &&
                     !@board.cell_valid?(item[0])
    end
    false
  end

  def swap_players
    @current_player = @current_player == @st_player ? @nd_player : @st_player
  end

  def winner_player
    @current_player.score += 1
    @current_player.name
  end

  def set_position
    puts "#{@current_player.name}, please select a position"
    position = gets.chomp.to_i
    position = pos_checker(position)
    board.set_cell(position, @current_player.sym)
    board.display_board
  end

  def pos_checker(position)
    until board.cell_valid?(position)
      puts "Don't cheat #{current_player.name}"
      puts "#{@current_player.name}, please select a position"
      position = gets.chomp.to_i
    end
    position
  end

  def end_game?
    return true if game_won? || game_draw?

    false
  end

  def print_game_result
    puts "#{winner_player} Wins" if game_won?
    puts 'Game is drawn' if game_draw?
  end

  def play_turn
    board.reset_board
    while @turns < 9
      set_position
      if end_game?
        print_game_result
        break
      end
      swap_players
    end
    print_score
  end
end
