class Grid
  def initialize
    @ships = []
  end

  def display
  puts "    1   2   3   4   5   6   7   8   9   10
  -----------------------------------------
A |   |   |   |   |   |   |   |   |   |   |
B |   |   |   |   |   |   |   |   |   |   |
C |   |   |   |   |   |   |   |   |   |   |
D |   |   |   |   |   |   |   |   |   |   |
E |   |   |   |   |   |   |   |   |   |   |
F |   |   |   |   |   |   |   |   |   |   |
G |   |   |   |   |   |   |   |   |   |   |
H |   |   |   |   |   |   |   |   |   |   |
I |   |   |   |   |   |   |   |   |   |   |
J |   |   |   |   |   |   |   |   |   |   |
  -----------------------------------------"

  end

  def has_ship_on?(x, y)
    @ships.each do |s|
      return true if s.covers?(x, y)
    end
    false
  end

  def place_ship(ship, x, y, across)
    ship.place(x, y, across)
    @ship << ship
  end
end
