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
          @ship_coordinates << Position.new(i, y)
        end
      elsif across == false
        (y...@length+y).each do |j|
          @ship_coordinates << Position.new(x, j)
        end
      end
    else
      return false
    end
    true
  end

  def covers?(x, y)
    @ship_coordinates.each do |p|
      return p if x == p.x && y == p.y
    end
    false
  end

  def overlaps_with?(ship_object)
    @ship_coordinates.each do |p|
      return true if ship_object.covers?(p.x, p.y)
    end
    false
  end

  def fire_at(x, y)
    position = covers?(x, y)
    position && position.hit!
  end

  def hit_on?(x, y)
    position = covers(x, y)
    position && position.hit?
  end

  def sunk?
    return false if @ship_coordinates.empty?
    all_hit = true
    @ship_coordinates.each do |p|
      all_hit = false if !p.hit?
    end
    all_hit
  end
end
