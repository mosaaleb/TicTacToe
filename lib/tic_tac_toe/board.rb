# board class
class Board
  attr_accessor :grid
  def initialize
    @grid = Array.new(9)
  end

  def display_board
    i = 0
    puts '--------------------------'
    while i < @grid.length - 1
      puts "|   #{@grid[i]}   |   #{@grid[i + 1]}   |   #{@grid[i + 2]}    |"
      puts '--------------------------'
      i += 3
    end
  end

  def board_full?
    return false if grid.any?(&:nil?)

    true
  end

  def cell_valid?(num)
    @grid[num].nil?
  end

  def get_cell(position)
    @grid[position]
  end

  def set_cell(position, symbol)
    @grid[position] = symbol
  end

  def horizontal_match
    i = 0
    until i > 6
      return true if @grid[i] == @grid[i + 1] &&
                     @grid[i + 1] == @grid[i + 2] && !@grid[i].nil?

      i += 3
    end
    false
  end

  def vertical_match
    3.times do |i|
      return true if @grid[i] == @grid[i + 3] &&
                     @grid[i + 3] == @grid[i + 6] && !grid[i].nil?
    end
    false
  end

  def diagonal_match
    return false if @grid[4].nil?

    @grid[0] == @grid[4] && @grid[4] == @grid[8] ||
      @grid[2] == @grid[4] && @grid[4] == @grid[6]
  end

  def reset_board
    @grid = Array.new(9)
  end
end
