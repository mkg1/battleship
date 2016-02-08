class Player
end

class HumanPlayer < Player
  attr_reader :name
  def initialize (name = "Dave")
    @name = name
  end
end

class ComputerPlayer < Player
  attr_reader :name
  def initialize
    @name = "HAL 9000"
  end
end

class Ship
  attr_reader :length
  def initialize (length)
    @length = length
  end

  def place (x, y, across)
    @x = x
    @y = y
    @across = across
    if @across == true
      @length.times do
        covers?(x, y)
        x += 1
      end
    elsif @across == false
      @length.times do
        covers?(x, y)
        y += 1
      end
    end
  end

  def covers?(x, y)
    if @across == true
      if (x >= @x) && (x < (@x + @length)) && y == @y
        return true
      end
    elsif @across == false
      if (y >= @y) && (y < (@y + @length)) && x == @x
        return true
      end
    end
  end
end

ship = Ship.new(4)
ship.place(2, 1, true)
ship.covers?(4, 2)
