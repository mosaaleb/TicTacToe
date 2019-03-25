
class TicTacToe
  attr_accessor :board
  @@turn = 0
  
  WINNING_COMBINATION = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],

  [0, 3, 6],
  [1, 2, 7],
  [2, 5, 8],

  [0, 4, 8],
  [2, 4, 6]
]


  def turn
    @@turn
  end

 def initialize
  @board = ["_", "_", "_", "_", "_", "_", "_", "_", "_"]

 end
  def display_board

  puts "    #{@board[0]}     |     #{@board[1]}     |     #{@board[2]}    "
  puts "-----------------------------------"
  puts "    #{@board[3]}     |     #{@board[4]}     |     #{@board[5]}    "
  puts "-----------------------------------"
  puts "    #{@board[6]}     |     #{@board[7]}     |     #{@board[8]}    "
  puts "-----------------------------------"
  end

  def welcome
  puts "Get ready to play TIC-TAC_TOE"
  end

  def end_game
  puts "Thank you for playing TIC_TAC_TOE"
  end

  def ask_player
  puts "input a position from 0 to 8"
  @position = gets.chomp.to_i
  if @position > 8 || @board[@position] != '_'
    puts "Oho, Don't cheat"
    ask_player
  end
  end

  def edit_board
    if @@turn % 2 == 0
      char_play = 'X'
    elsif
      char_play = 'O'
    end
    @board[@position] = char_play
    display_board
    @@turn += 1
    #return self.winner_player if game_won?
    p  game_won? 
  end


  def game_won?
    WINNING_COMBINATION.each do |item|
      # 0, 1, 2
      first_index = item[0]
      second_index = item[1]
      third_index = item[2]
      return true if @board[first_index] == @board[second_index] && @board[second_index] == @board[third_index] && @board[first_index] != '_'
    end
    return false
  end

end

new_game = TicTacToe.new
new_game.welcome


while new_game.turn < 9
  new_game.ask_player
  new_game.edit_board
end

new_game.end_game