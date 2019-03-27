require './lib/tic_tac_toe/board'

describe Board do
  describe '#initialize' do
    board = Board.new
    it 'creates an instance of board class with new array' do
      expect(board.grid).to eq(Array.new(9, ' '))
    end
  end

  describe '#board_full?' do
    board = Board.new
    it 'returns a boolean value if board is full or not' do
      expect(board.board_full?).to eq(true).or eq(false)
    end
  end

  describe '#cell_valid?(num)' do
    board = Board.new
    p board.cell_valid?(0)
    it 'returns a boolean if a cell is empty or not' do
      expect(board.cell_valid?(0)).to eq(true).or eq(false)
    end

    # it 'return false if number of the cell is already taken' do
    #   expect(board.cell_valid?(0)).to eq(false) if 
    # end
  end
end
