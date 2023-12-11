# frozen_string_literal: true

class DayEleven2023
  def self.part_one(lines)
    solve(lines, coeficient: 1)
  end

  def self.part_two(lines)
    solve(lines, coeficient: 999_999)
  end

  class << self
    def solve(lines, coeficient:)
      galaxies, vertical_expansion, horizontal_expansion = create_universe(lines)
      galaxies.combination(2).sum do |(x1, y1), (x2, y2)|
        distance = (x2 - x1).abs + (y2 - y1).abs
        vertical_expansion.each do |expansion|
          min, max = [x1, x2].minmax
          distance += coeficient if (min..max).cover? expansion
        end
        horizontal_expansion.each do |expansion|
          min, max = [y1, y2].minmax
          distance += coeficient if (min..max).cover? expansion
        end
        distance
      end
    end

    def create_universe(lines)
      vertical_expansion = Set.new
      horizontal_expansion = Set.new
      galaxies = lines.each_with_index.with_object([]) do |(column, idx), acc|
        vertical_expansion.add(idx) if column.chars.uniq.size == 1
        column.chars.each_with_index do |row, idy|
          horizontal_expansion.add(idy) if lines.map { |line| line[idy] }.uniq.size == 1
          acc << [idx, idy] if row == "#"
        end
      end

      [galaxies, vertical_expansion, horizontal_expansion]
    end
  end
end
