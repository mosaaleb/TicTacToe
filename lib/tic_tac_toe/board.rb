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

  def reset_board
    @grid = Array.new(9)
  end
end
