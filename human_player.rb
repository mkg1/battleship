require './grid.rb'

class HumanPlayer < Player
  attr_reader :name, :grid
  def initialize (name = "Dave")
    @grid = Grid.new
    @name = name
  end

end
