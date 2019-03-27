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

  describe '#print_score' do
    it 'should print scores' do
      expect(game.print_score).to output("#{@st_player.name}:#{@st_player.score}
        \nVS\n#{@nd_player.name}:#{@nd_player.score}\n").to_stdout
    end
  end
end
