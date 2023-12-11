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
      galaxies.combination(2).sum do |galaxy, another_galaxy|
        distance = (another_galaxy.first - galaxy.first).abs + (another_galaxy[1] - galaxy[1]).abs
        vertical_expansion.each do |expansion|
          if (galaxy.first < expansion && another_galaxy.first > expansion) ||(another_galaxy.first < expansion && galaxy.first > expansion) # rubocop:disable Layout/LineLength
            distance += coeficient
          end
        end
        horizontal_expansion.each do |expansion|
          if (galaxy[1] < expansion && another_galaxy[1] > expansion) || (another_galaxy[1] < expansion && galaxy[1] > expansion) # rubocop:disable Layout/LineLength
            distance += coeficient
          end
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
