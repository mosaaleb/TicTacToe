require './lib/tic_tac_toe/game'

describe Game do
  # game = Game.new
  describe '#initialize' do
    let(:game) { described_class.new }
    it 'should initialize players and board' do
      game.st_player.name = 'm'
      game.nd_player.name = 'k'
      expect(game.board).not_to be_nil
      expect(game.st_player.name).not_to be_empty
      expect(game.nd_player.name).not_to be_empty
    end
  end

  describe '#game_won?' do
    let(:game) { described_class.new }
    it 'should just return boolean true or false' do
      expect(game.game_won?).to eq(true).or eq(false)
    end
    it 'should return true if a match found' do
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

  describe '#winner_player' do
    let(:game) { described_class.new }
    it 'should return the first player name' do
      game.current_player = game.st_player
      expect(game.winner_player).to eq(game.st_player.name)
    end
    it 'should return the second player name' do
      game.current_player = game.nd_player
      expect(game.winner_player).to eq(game.nd_player.name)
    end
  end

  describe '#swap_players' do
    let(:game) { described_class.new }
    it 'should change player turns' do
      game.current_player = game.st_player
      game.swap_players
      expect(game.current_player).to eq(game.nd_player)
    end
  end

  describe '#end_game?' do
    context '#end_game' do
      let(:game) { described_class.new }
      it 'returns true if game_won? is true' do
        allow(game).to receive(:game_won?).and_return(true)
        expect(game.end_game?).to eq(true)
      end
      it 'returns true if game_draw? is true' do
        allow(game).to receive(:game_draw?).and_return(true)
        expect(game.end_game?).to eq(true)
      end
      it 'returns false if game_draw? and game_won? are both false' do
        allow(game).to receive(:game_won?).and_return(false)
        expect(game.end_game?).to eq(false)
      end
    end
  end
end
