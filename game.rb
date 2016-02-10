class Game
  attr_reader :human, :computer
  def initialize (human, computer)
    @human = human
    @computer = computer
  end

  def welcome
    puts "Welcome, #{human.name} and #{computer.name}!\nIt's time to play Battleship.\n"
  end
end
