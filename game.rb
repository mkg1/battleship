class Game
  attr_reader :human, :computer
  def initialize (human, computer)
    @human = human
    @computer = computer
  end

  def welcome
    puts "Welcome, #{human.name} and #{computer.name}!\nIt's time to play Battleship.\n"
  end

  def place_ships
    ship_array = [2, 3, 3, 4, 5]
    @human.place_ships(ship_array)
    @computer.place_ships(ship_array)
  end
end
