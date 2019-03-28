require './lib/tic_tac_toe/game'

describe Game do
  game = Game.new
  describe '#initialize' do
    it 'should initialize players and board' do
      expect(game.board).not_to be_nil
      expect(game.st_player.name).not_to be_empty
      expect(game.nd_player.name).not_to be_empty
    end
  end

  # describe '#print_score' do
  #   it 'should print scores' do
  #     expect(game.print_score).to output("#{@st_player.name}:#{@st_player.score}
  #       \nVS\n#{@nd_player.name}:#{@nd_player.score}\n").to_stdout
  #   end
  # end

  describe '#game_won?' do
    it 'should just return boolean true or false' do
      expect(game.game_won?).to eq(true).or eq(false)
    end
    it 'should return ture if a match found' do
      game.board.set_cell(0, 'X')
      game.board.set_cell(1, 'X')
      game.board.set_cell(2, 'X')
      expect(game.game_won?).to eq(true)
    end
    it 'should return false if not match found' do
      game.board.set_cell(0, 'O')
      game.board.set_cell(1, 'X')
      expect(game.game_won?).to eq(false)
    end
  end
end
