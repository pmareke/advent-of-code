# frozen_string_literal: true

class DayEighteen2023
  def self.part_one(lines)
    matrix = lines.reduce([]) { |acc, line| acc << line.split }
    interior, exterior = solve_maze(matrix)
    interior = calculate_interior_points(interior, exterior)
    interior + exterior
  end

  def self.part_two(lines)
    matrix = lines.reduce([]) { |acc, line| acc << line.split }
    interior, exterior = solve_complex_maze(matrix)
    interior = calculate_interior_points(interior, exterior)
    interior + exterior
  end

  class << self
    def solve_maze(matrix)
      point = [0, 0]
      exterior = 0
      seen = Set.new([point])
      matrix.reduce(seen) do |acc, (direction, times, _color)|
        dx, dy = { "R" => [0, 1], "L" => [0, -1], "D" => [1, 0], "U" => [-1, 0] }[direction]
        point = [(times.to_i * dx) + point.first, (times.to_i * dy) + point[1]]
        exterior += times.to_i
        acc << point
      end
      [seen, exterior]
    end

    def solve_complex_maze(matrix)
      point = [0, 0]
      exterior = 0
      seen = Set.new([point])
      matrix.reduce(seen) do |acc, (_direction, _times, color)|
        hex = color.scan(/(?:[a-z0-9]+)/).first
        times = "0x#{hex[0...hex.size - 1]}".to_i(16)
        direction = hex.chars.last.to_i
        dx, dy = { 0 => [0, 1], 1 => [1, 0], 2 => [0, -1], 3 => [-1, 0] }[direction]
        point = [(times.to_i * dx) + point.first, (times.to_i * dy) + point[1]]
        exterior += times.to_i
        acc << point
      end
      [seen, exterior]
    end

    def calculate_interior_points(interior, exterior)
      calculate_polygon_area(interior) - (0.5 * exterior) + 1
    end

    def calculate_polygon_area(vertices)
      0.5 * vertices.each_cons(2).sum { |x, y| (x.first * y[1]) - (x[1] * y.first) }.abs
    end
  end
end
