require_relative 'player'
require_relative 'board'

# game class
class Game
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
end
