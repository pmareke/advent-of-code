# frozen_string_literal: true

class DayNine2021
  def self.part_one(lines)
    matrix = lines.each_with_object([]) { |line, acc| acc << line.chars.map(&:to_i) }
    lowers = find_lowers(matrix)
    lowers.sum(&:next)
  end

  def self.part_two(lines)
    matrix = lines.each_with_object([]) { |line, acc| acc << line.chars.map(&:to_i) }
    basins = find_basins(matrix)
    basins.sort.reverse.take(3).reduce(&:*)
  end

  class << self
    def find_lowers(matrix)
      lines = matrix.size
      line_size = matrix.first.size
      lines.times.each_with_object([]) do |idx, acc|
        line_size.times do |idy|
          point = [idx, idy]
          candidates = find_neighbords(matrix, point).map { |n| matrix[n.first][n.last] }
          lower = matrix[idx][idy]
          acc << lower if candidates.all? { |candidate| candidate > lower }
        end
      end
    end

    def find_basins(matrix)
      lines = matrix.size
      line_size = matrix.first.size
      lines.times.each_with_object([]) do |idx, acc|
        line_size.times do |idy|
          point = [idx, idy]
          acc << calculate_basin_size(matrix, point)
        end
      end
    end

    def calculate_basin_size(matrix, low_point)
      queue = [low_point]
      seen = Set.new
      until queue.empty?
        point = queue.pop
        seen << point

        value = matrix[point.first][point.last]
        neighbords = find_neighbords(matrix, point)
        neighbords.each do |neighbord|
          neighbord_value = matrix[neighbord.first][neighbord.last]
          queue << neighbord unless neighbord_value >= 9 || neighbord_value <= value || seen.include?(neighbord)
        end
      end
      seen.size
    end

    def find_neighbords(matrix, point)
      [[0, 1], [0, -1], [1, 0], [-1, 0]].each_with_object([]) do |(x, y), acc|
        next if (point.first + x).negative? || (point.first + x) >= matrix.size
        next if (point.last + y).negative? || (point.last + y) >= matrix.first.size

        acc << [point.first + x, point.last + y]
      end
    end
  end
end
