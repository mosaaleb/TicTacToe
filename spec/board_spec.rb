require './lib/tic_tac_toe/board'

describe Board do
  before(:all) do
    @board = Board.new
  end

  describe '#initialize board' do
    it 'creates an instance of board class with new array' do
      expect(@board.grid).to eq(Array.new(9))
    end
  end

  describe '#board_full?' do
    it 'returns true if board full' do
      @board.grid.fill('X')
      expect(@board.board_full?).to eq(true)
    end
  end

  describe '#cell_valid?(num)' do
    it 'returns a boolean if a cell is empty or not' do
      expect(@board.cell_valid?(0)).to eq(true).or eq(false)
    end
    it 'return false if number of the cell is already taken' do
      @board.grid[0] = 'X'
      expect(@board.cell_valid?(0)).to eq(false)
    end
  end

  describe '#set_cell(position, symbol)' do
    it 'sets cell at specified position with symbol' do
      @board.set_cell(1, 'X')
      expect(@board.grid[1]).to eq 'X'
    end
  end
end
