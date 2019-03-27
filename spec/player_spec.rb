require './lib/tic_tac_toe/player'

describe Player do
  describe '#initialize' do
    it 'takes 1 arguments name' do
      expect(Player).to respond_to(:new).with(1).argument
    end
  end
end
