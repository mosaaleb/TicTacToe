
class TicTacToe
  attr_accessor :board
@@turn = 0

 def initialize
  @board = ["_", "_", "_", "_", "_", "_", "_", "_", "_"]

 end
  def display_board

  puts "    #{board[0]}     |     #{board[1]}     |     #{board[2]}    "
  puts "-----------------------------------"
  puts "    #{board[3]}     |     #{board[4]}     |     #{board[5]}    "
  puts "-----------------------------------"
  puts "    #{board[6]}     |     #{board[7]}     |     #{board[8]}    "
  puts "-----------------------------------"
  end

  def welcome
  puts "Get ready to play TIC-TAC_TOE"
  end

  def end_game
  puts "Thank you for playing TIC_TAC_TOE"
  end

  def ask_player
  puts "input a position from 1 to 9"
  @position = gets.chomp.to_i - 1
  if @position > 9
    puts "the number has to be between 1 - 9"
    ask_player
  end
  @@turn += 1
  end

  def edit_board
    if 
    @board[@position] = @sign
    display_board
  end

  def player_turn
    if @@turn % 2 == 0
      puts "player 2 turn"
    else
      puts "player 1 turn"
    end
  end

end

new_game = TicTacToe.new
new_game.welcome
new_game.ask_player
new_game.edit_board
new_game.end_game