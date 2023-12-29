# frozen_string_literal: true

class DayTen2019
  def self.part_one(lines)
    asteriods = parse_input(lines)
    _, lines_of_sight = find_lines_of_sight(asteriods)
    lines_of_sight.size
  end

  def self.part_two(lines)
    asteriods = parse_input(lines)
    location, lines_of_sight = find_lines_of_sight(asteriods)
    target = lines_of_sight.sort[199].last
    minimum = target.min_by { |asteroid| distance_between(location, asteroid) }
    (minimum.first * 100) + minimum.last
  end

  class << self
    def parse_input(lines)
      lines.each_with_index.flat_map do |line, idx|
        line.chars.each_with_index.flat_map do |char, idy|
          char == "#" ? [[idy, idx]] : []
        end
      end
    end

    def find_lines_of_sight(asteroids)
      lines_of_sight = asteroids.each_with_object([]) do |asteroid, acc|
        others = asteroids - asteroid
        lines = others.group_by { |other| angle_between(asteroid, other) }
        acc << [asteroid, lines]
      end
      lines_of_sight.max_by { |_, lines| lines.size }
    end

    def angle_between(point, another)
      x1, y1 = point
      x2, y2 = another
      Math.atan2(x2 - x1, -(y2 - y1)) % (2 * Math::PI)
    end

    def distance_between(point, another)
      x1, y1 = point
      x2, y2 = another
      Math.sqrt(((x1 - x2) ** 2) + ((y1 - y2) ** 2))
    end
  end
end
