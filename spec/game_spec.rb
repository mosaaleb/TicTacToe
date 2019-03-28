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

  describe '#current_player' do
    it 'return first player' do
      game.turn = 0
      expect(game.set_current_player).to eq(game.st_player)
    end
    it 'return second player' do
      game.turn = 1
      expect(game.set_current_player).to eq(game.nd_player)
    end
  end

  describe '#winner_player' do
    it 'should return the first player name' do
      game.current_player = game.st_player
      expect(game.winner_player).to eq(game.st_player.name)
    end
    it 'should return the second player name' do
      game.current_player = game.nd_player
      expect(game.winner_player).to eq(game.nd_player.name)
    end
  end

  describe '#play' do
    it 'should update the cell of the position given' do
      game.board.set_cell(3, 'X')
      expect(game.play)
    end
  end
end
