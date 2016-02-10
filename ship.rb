require 'byebug'

class Ship
  attr_reader :length
  def initialize (length)
    @length = length
    @ship_coordinates = []
  end

  def place (x, y, across)
    if @ship_coordinates.empty?
      length.times do |i|
        if across
          @ship_coordinates << Position.new(x+i, y)
        else
          @ship_coordinates << Position.new(x, y+i)
        end
      end
    end
  end

  def covers?(x, y)
    @ship_coordinates.each do |p|
      return p if x == p.x && y == p.y
    end
    return false
  end

  def overlaps_with?(ship_object)
    @ship_coordinates.any? {|p| ship_object.covers?(p.x, p.y)}
  end

  def fire_at(x, y)
    position = covers?(x, y)
    position && position.hit!
  end

  def hit_on?(x, y)
    position = covers?(x, y)
    position && position.hit?
  end

  def sunk?
    !@ship_coordinates.empty? && @ship_coordinates.all? {|p| p.hit?}
  end
end
