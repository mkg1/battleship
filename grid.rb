require './player.rb'
require './human_player.rb'
require './computer_player.rb'
require './grid.rb'
require './ship.rb'
require './position.rb'

class Grid
  def initialize
    @ships = []
    @hits = []
    @total_ships = 0
    @total_hits = 0
  end

  def display
    display_header
    display_line
    ("A".."J").each_with_index do |l, i|
      y = i+1
      line = l + " |"
      (1..10).each do |x|
        ship = has_ship_on?(x, y)
        line << if ship && @hits.include?([x,y])
          # @total_hits += 1
          " X |"
        elsif ship
          " O |"
        else
          "   |"
        end
      end
        puts line
      end
    display_line
  end

  private def display_line
    puts "  -----------------------------------------"
  end
  private def display_header
    puts "    1   2   3   4   5   6   7   8   9   10"
  end

  def has_ship_on?(x, y)
    @ships.each do |s|
      return true if s.covers?(x, y)
    end
    false
  end

  def place_ship(ship, x, y, across)
    ship.place(x, y, across)
    overlap = false
    @ships.each do |p|
      if p.overlaps_with? (ship)
        overlap = true
      end
    end
    unless overlap
      @total_ships += ship.length
      @ships << ship
    end
  end

  def fire_at(x, y)
    if @hits.include?([x, y])
      return false
    else
      @total_hits += 1
      @hits << [x, y]
    end
    if x > 10 || y > 10
      return false
    elsif has_ship_on?(x, y)
      return true
    else
      return false
    end
  end

  def sunk?
    if @total_ships == @total_hits && @total_ships != 0
      return true
    end
    false
  end

  def x_of(coordinates)
    x = coordinates.split("", 2)
    return x[1].to_i
  end

  def y_of(coordinates)
    y_letter = coordinates.split("", 2)
    ("A".."J").each_with_index do |l, i|
      y = i + 1
      return y if y_letter[0] == l
    end
  end 
end

# grid = Grid.new
# puts grid.sunk?
# grid.place_ship(Ship.new(2), 6, 4, true)
# puts grid.sunk?
# grid.fire_at(6, 4)
# puts grid.sunk?
# grid.fire_at(7, 4)
# puts grid.sunk?
