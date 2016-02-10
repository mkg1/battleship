require './player.rb'

class ComputerPlayer < Player
  def name
    "HAL 9000"
  end
  def place_ships(array)
    ship_number = 0
    while(ship_number < array.length)
      len = array[ship_number]
      x_coordinate = rand(1..10)
      y_coordinate = rand(1..10)
      across = [true, false].sample

      if grid.place_ship(Ship.new(len), x_coordinate, y_coordinate, across)
        ship_number += 1
      end
    end
    puts "#{name} has placed its ships."
  end

  def call_shot
    "A1"
  end
end
