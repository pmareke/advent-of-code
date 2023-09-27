# frozen_string_literal: true

require "set"

class DayOne2016
  def self.part_one(coordinates)
    dx = [0, 1, 0, -1]
    dy = [-1, 0, 1, 0]
    d = x = y = 0
    coordinates.each do |coordinate|
      z = coordinate.start_with?("L") ? 3 : 1
      d = (d + z) % 4
      distance = coordinate[1..].to_i
      x += dx[d] * distance
      y += dy[d] * distance
    end
    x.abs + y.abs
  end

  def self.part_two(coordinates)
    seen = Set[]
    dx = [0, 1, 0, -1]
    dy = [-1, 0, 1, 0]
    d = x = y = 0
    coordinates.each do |coordinate|
      z = coordinate.start_with?("L") ? 3 : 1
      d = (d + z) % 4
      distance = coordinate[1..].to_i
      (0...distance).each do |_|
        x += dx[d]
        y += dy[d]
        point = "#{x},#{y}"
        return x.abs + y.abs if seen.include?(point)

        seen.add(point)
      end
    end
  end
end
