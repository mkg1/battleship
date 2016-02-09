require './grid.rb'

def get_user_input
  gets.chomp
end

class HumanPlayer < Player
  attr_reader :name, :grid
  def initialize (name = "Dave")
    @grid = Grid.new
    @name = name
  end

  def place_ships(array)
    puts "#{@name}, where would you like to place a ship of length #{array[0]}?"
    puts "Across or Down?"
    puts "#{@name}, where would you like to place a ship of length #{array[1]}?"
    puts "Across or Down?"
  end

  def ships
  end

  def length
  end
  
end
