# Player class
class Player
  attr_accessor :score
  attr_reader :name
  def initialize(name, score)
    @name = name
    @score = score
  end
end
