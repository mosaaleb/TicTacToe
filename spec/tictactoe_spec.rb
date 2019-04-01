require './lib/tic_tac_toe'

describe TicTacToe do
  describe '#initialize' do
    let(:test_game) { described_class.new }
    it 'creates an instance game of a game, keep_playing and turns variables' do
      expect(test_game.keep_playing).to eq(true)
      expect(test_game.turns).to eq(0)
      expect(test_game.game.board).not_to be_nil
    end
  end

  describe '#get_answer(answer)' do
    let(:index){['Y', 'N']}
    it 'gets the players answer' do
      expect()
    end
  end
end
