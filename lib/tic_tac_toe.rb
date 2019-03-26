require_relative 'players'
# Tic-Tac-Toe executable file
class TicTacToe
  WINNING_COMBINATION = [
    [0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6],
    [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]
  ].freeze

  def initialize
    @board = %w[_ _ _ _ _ _ _ _ _]
    @turn = 0
    puts 'Get ready to play TIC-TAC_TOE'
  end

  def generate_players
    puts 'Enter the first player and the second player names'
    name1 = gets.chomp
    name2 = gets.chomp
    @player1 = Player.new(name1, 0)
    @player2 = Player.new(name2, 0)
  end

  def play
    initialize
    while @turn < 9
      ask_player
      edit_board
      draw if game_full?
    end
  end

  def end_game
    puts 'Thank you for playing TIC_TAC_TOE'
    exit
  end

  def display_board
    i = 0
    puts '--------------------------'
    while i < @board.length - 1
      puts "|   #{@board[i]}   |   #{@board[i + 1]}   |   #{@board[i + 2]}    |"
      puts '--------------------------'
      i += 3
    end
  end

  def ask_player
    puts 'input a position from 0 to 8'
    @position = gets.chomp.to_i
    invalid_pos if @position > 8 || @board[@position] != '_'
  end

  def invalid_pos
    puts 'invalid position'
    ask_player
  end

  def edit_board
    @char_play = ''
    @char_play = @turn.even? ? 'X' : 'O'
    @board[@position] = @char_play
    display_board
    @turn += 1
    winner_player(@char_play) if game_won?
  end

  def game_won?
    WINNING_COMBINATION.each do |item|
      return true if @board[item[0]] == @board[item[1]] &&
                     @board[item[1]] == @board[item[2]] &&
                     @board[item[0]] != '_'
    end
    false
  end

  def winner_player(char_winner_indicator)
    if char_winner_indicator == 'X'
      puts "#{@player1.name} wins"
      @player1.score += 1
    else
      puts "#{@player2.name} wins"
      @player2.score += 1
    end
    reset_game
  end

  def reset_game
    print_score
    puts 'Do you want to play again? Type Y or N'
    answer = gets.chomp.downcase
    get_answer(answer)
  end

  def get_answer(answer)
    if answer == 'y' then play
    elsif answer == 'n'
      end_game
    else
      puts 'invalid choice'
      reset_game
    end
  end

  def game_full?
    return true if @board.none? { |x| x == '_' }
  end

  def draw
    puts 'The game is a draw'
    reset_game
  end

  def print_score
    print "#{@player1.name} : #{@player1.score} VS "
    print "#{@player2.name} : #{@player2.score} \n"
  end
end
