class TicTacToe
  attr_accessor :board

  WINNING_COMBINATION = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6]
  ].freeze

  def generate_players
    puts 'Enter the first player name'
    name1 = gets.chomp
    puts 'Enter the second player name'
    name2 = gets.chomp
    # Player class objects
    @@player1 = Player.new(name1, 0)
    @@player2 = Player.new(name2, 0)
  end

  def play
    while @turn < 9
      ask_player
      edit_board
      draw if game_full?
    end
  end

  private 

  def initialize
    @board = %w[_ _ _ _ _ _ _ _ _]
    @turn = 0
  end

  def display_board
    puts "    #{@board[0]}     |     #{@board[1]}     |     #{@board[2]}    "
    puts '-----------------------------------'
    puts "    #{@board[3]}     |     #{@board[4]}     |     #{@board[5]}    "
    puts '-----------------------------------'
    puts "    #{@board[6]}     |     #{@board[7]}     |     #{@board[8]}    "
    puts '-----------------------------------'
  end

  def welcome
    puts 'Get ready to play TIC-TAC_TOE'
  end

  def end_game
    puts 'Thank you for playing TIC_TAC_TOE'
    exit
  end

  def ask_player
    puts 'input a position from 0 to 8'
    @position = gets.chomp.to_i
    puts "Oho, Don't cheat" if @position > 8 || @board[@position] != '_'
      ask_player
    end
  end

  def edit_board
    @char_play = ''
    if @turn.even?
      @char_play = 'X'
    elsif (@char_play = 'O')
    end
    @board[@position] = @char_play
    display_board
    @turn += 1
    winner_player(@char_play) if game_won?
  end

  def game_won?
    WINNING_COMBINATION.each do |item|
      first_index = item[0]
      second_index = item[1]
      third_index = item[2]
      if @board[first_index] == @board[second_index] && @board[second_index] == @board[third_index] && @board[first_index] != '_'
        return true
      end
    end
    false
  end

  def winner_player(char_winner_indicator)
    if char_winner_indicator == 'X'
      puts "#{@@player1.name} wins"
      @@player1.score += 1
    else
      puts "#{@@player2.name} wins"
      @@player2.score += 1
    end
    reset_game
  end

  def reset_game
    print_score
    puts 'Do you want to play again? Type Y or N'
    answer = gets.chomp.downcase
    if answer == 'y'
      initialize
      play
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
    puts "#{@@player1.name} : #{@@player1.score} VS #{@@player2.name} : #{@@player2.score}"
  end
end

class Player
  attr_accessor :score
  attr_reader :name
  def initialize(name, score)
    @name = name
    @score = score
  end
end

new_game = TicTacToe.new
new_game.generate_players
new_game.play
