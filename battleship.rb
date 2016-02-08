require 'byebug'

class Ship
  attr_reader :length, :ship_coordinates
  def initialize (length)
    @length = length
    @ship_coordinates = []
  end

  def place (x, y, across)
    if @ship_coordinates.empty?
      if across == true
        (x...@length+x).each do |i|
          @ship_coordinates << [i,y]
        end
      elsif across == false
        (y...@length+y).each do |j|
          @ship_coordinates << [x,j]
        end
      end
    else
      return false
    end
  end

  def covers?(x, y)
    @ship_coordinates.include?([x, y])
  end

  def overlaps_with?(ship_object)
    @ship_coordinates.each do |place|
      if ship_object.covers?(place[0],place[1])
      end
    end
  end
end
