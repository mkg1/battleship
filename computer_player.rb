require './grid.rb'

class ComputerPlayer < Player
  attr_reader :name, :grid
  def initialize
    @name = "HAL 9000"
    @grid = Grid.new
  end
end
