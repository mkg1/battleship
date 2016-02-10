class Game
  attr_reader :player1, :player2
  def initialize (player1, player2)
    @player1 = player1
    @player2 = player2
  end

  def welcome
    puts "Welcome, #{player1.name} and #{player2.name}!\nIt's time to play Battleship.\n"
  end

  def place_ships
    ship_array = [2, 3, 3, 4, 5]
    @player1.place_ships(ship_array)
    @player2.place_ships(ship_array)
  end

  def display_status
    puts "SHOTS TAKEN:"
    @player1.display_shots_grid
    puts "\n"
    puts "YOUR BOARD:"
    @player1.display_grid
  end

  def x_of(coordinates)
    coordinates[/\d+/].to_i
  end

  def y_of(coordinates)
    coordinates[0].ord - 'A'.ord + 1
  end

  def take_turn
    coordinates = @player1.call_shot
    x = x_of(coordinates)
    y = y_of(coordinates)
    @player2.ships.each do |s|
      if s.covers?(x,y)
        puts "Hit!"
      else
        puts "Miss!"
      end
    end
  end
end
