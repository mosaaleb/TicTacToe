require './lib/tic_tac_toe/board'

describe Board do
  describe '#initialize' do
    board = Board.new
    it 'creates an instance of board class with new array' do
      expect(board.grid).to eq(Array.new(9, '_'))
    end
  end

  describe '#board_full?' do
    our_board = Board.new
    it 'returns a boolean value if board is full or not' do
      expect(our_board.board_full?).to eq(true).or eq(false)
    end
    it 'returns true if board full' do
      scnd_board = Board.new
      scnd_board.grid.fill('X')
      expect(scnd_board.board_full?).to eq(true)
    end
  end

  describe '#cell_valid?(num)' do
    board = Board.new
    it 'returns a boolean if a cell is empty or not' do
      expect(board.cell_valid?(0)).to eq(true).or eq(false)
    end
    it 'return false if number of the cell is already taken' do
      board = Board.new
      board.grid[0] = 'X'
      expect(board.cell_valid?(0)).to eq(false)
    end
  end

  describe '#set_cell(position, symbol)' do
    it 'sets cell at specified position with symbol' do
      board = Board.new
      board.set_cell(1, 'X')
      expect(board.grid[1]).to eq 'X'
    end
  end
end
