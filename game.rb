class Game
  attr_reader :players
  def initialize (player1, player2)
    @players = [player1, player2]
  end

  def welcome
    puts "Welcome, #{@players[0].name} and #{@players[1].name}!\nIt's time to play Battleship.\n"
  end

  def place_ships
    ship_array = [2, 3, 3, 4, 5]
    @players[0].place_ships(ship_array)
    @players[1].place_ships(ship_array)
  end

  def display_status
    puts "SHOTS TAKEN:"
    @players[0].display_shots_grid
    puts "\n"
    puts "YOUR BOARD:"
    @players[0].display_grid
  end

  def x_of(coordinates)
    coordinates[/\d+/].to_i
  end

  def y_of(coordinates)
    coordinates[0].ord - 'A'.ord + 1
  end

  def take_turn
    coordinates = @players[0].call_shot
    x = x_of(coordinates)
    y = y_of(coordinates)
    @players[1].ships.each do |s|
      if s.covers?(x,y)
        puts "Hit!"
      else
        puts "Miss!"
      end
    end
    @players = @players.reverse
  end
end
