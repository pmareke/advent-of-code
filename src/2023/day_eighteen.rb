# frozen_string_literal: true

class DayEighteen2023
  def self.part_one(lines)
    matrix = lines.reduce([]) do |acc, line|
      direction, times, color = line.split
      acc << [direction, times, color]
    end

    point = [0, 0]
    seen = Set.new([point])
    exterior = 0
    matrix.reduce(seen) do |acc, (direction, times, _color)|
      dx, dy = { "R" => [0, 1], "L" => [0, -1], "D" => [1, 0], "U" => [-1, 0] }[direction]
      point = [(times.to_i * dx) + point.first, (times.to_i * dy) + point[1]]
      exterior += times.to_i
      acc << point
    end

    area = calculate_polygon_area(seen)
    interior = calculate_interior_points(area, exterior)
    interior + exterior
  end

  def self.part_two(lines)
    matrix = lines.reduce([]) do |acc, line|
      direction, times, color = line.split
      acc << [direction, times, color]
    end

    point = [0, 0]
    seen = Set.new([point])
    exterior = 0
    matrix.reduce(seen) do |acc, (_direction, _times, color)|
      hex = color.scan(/(?:[a-z0-9]+)/).first
      times = "0x#{hex[0...hex.size - 1]}".to_i(16)
      direction = hex.chars.last.to_i
      dx, dy = { 0 => [0, 1], 1 => [1, 0], 2 => [0, -1], 3 => [-1, 0] }[direction]
      point = [(times.to_i * dx) + point.first, (times.to_i * dy) + point[1]]
      exterior += times.to_i
      acc << point
    end

    area = calculate_polygon_area(seen)
    interior = calculate_interior_points(area, exterior)
    interior + exterior
  end

  class << self
    def calculate_polygon_area(vertices)
      total = vertices.each_cons(2).sum do |x, y|
        (x.first * y[1]) - (x[1] * y.first)
      end
      0.5 * total.abs
    end

    def calculate_interior_points(area, border)
      (area - (0.5 * border) + 1).to_i
    end
  end
end
