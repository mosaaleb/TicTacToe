require './lib/tic_tac_toe/game'
require './lib/tic_tac_toe/player'

describe Game do
  before(:all) do
    @game = Game.new
  end

  describe '#initialize game' do
    it 'should initialize board' do
      expect(@game.board).not_to be_nil
    end
  end

  describe '#game_won?' do
    it 'should return true if a match found' do
      @game.board.set_cell(0, 'X')
      @game.board.set_cell(1, 'X')
      @game.board.set_cell(2, 'X')
      expect(@game.game_won?).to eq(true)
    end
    it 'should return false if not match found' do
      @game.board.set_cell(0, 'O')
      @game.board.set_cell(1, 'X')
      expect(@game.game_won?).to eq(false)
    end
  end

  describe '#winner_player' do
    context 'should return winner based on assigned current player' do
      it 'should return the first player name' do
        @st_player = Player.new('duck')
        @nd_player = Player.new('bunny')
        @game.current_player = @nd_player
        expect(@game.winner_player).to eq(@nd_player.name)
      end
    end
  end

  describe '#swap_players' do
    it 'should change player turns' do
      @game.current_player = @game.st_player
      @game.swap_players
      expect(@game.current_player).to eq(@game.nd_player)
    end
  end
  describe '#end_game?' do
    it 'returns true if game_won? is true' do
      allow(@game).to receive(:game_won?).and_return(true)
      expect(@game.end_game?).to eq(true)
    end
    it 'returns true if game_draw? is true' do
      allow(@game).to receive(:game_draw?).and_return(true)
      expect(@game.end_game?).to eq(true)
    end
    it 'returns false if game_draw? and game_won? are both false' do
      allow(@game).to receive(:game_won?).and_return(false)
      expect(@game.end_game?).to eq(false)
    end
  end

  describe '#game_draw?' do
    it 'returns false when either condition is false' do
      allow(@game.board).to receive(:board_full?).and_return(false)
      allow(@game).to receive(:game_won?).and_return(true)
      expect(@game.game_draw?).to eq(false)
    end
    it 'returns true when both conditions are true' do
      allow(@game.board).to receive(:board_full?).and_return(true)
      allow(@game).to receive(:game_won?).and_return(false)
      expect(@game.game_draw?).to eq(true)
    end
  end

  describe '#set_position' do
    it 'sets cell position, if position is valid' do
      position = 2
      sym = 'X'
      allow(@game).to receive(:pos_checker).with(position).and_return(true)
      allow(@game.board).to receive(:set_cell).with(position, sym)
      allow(@game.board).to receive(:get_cell).with(position).and_return(sym)
      expect(@game.board.get_cell(position)).to eq(sym)
    end
  end

  describe '#pos_checker' do
    it 'checks if position is valid and returns it if true' do
      allow(@game.board).to receive(:cell_valid?).with(0).and_return(true)
      expect(@game.pos_checker(0)).to eq(0)
    end
  end
end
