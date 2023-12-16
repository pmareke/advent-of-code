# frozen_string_literal: true

class DaySixteen2023
  def self.part_one(lines)
    matrix = lines.each_with_object([]) do |line, acc|
      chars = line.chars
      acc << chars.each_with_object([]) do |c, tmp|
        tmp << (c == "\\" ? "x" : c)
      end
    end
    point = [0, 0]
    tiles = energized(matrix, point)
    tiles.map { |t| t[0..1] }.uniq.size
  end

  def self.part_two(lines)
    matrix = lines.each_with_object([]) do |line, acc|
      chars = line.chars
      acc << chars.each_with_object([]) do |c, tmp|
        tmp << (c == "\\" ? "x" : c)
      end
    end
    matrix.size.times.each_with_object([]) do |idx, acc|
      matrix.first.size.size.times.reduce([]) do |_tmp, idy|
        [[0, 1], [1, 0], [0, -1], [-1, 0]].each do |x, y|
          next if x == y

          tiles = energized(matrix, [idx, idy], [x, y], [])
          acc <<  tiles.map { |t| t[0..1] }.uniq.size
        end
      end
      acc
    end.max
  end

  class << self
    def energized(matrix, point, direction = [0, 1], seen = [])
      return seen if seen.include?([point.first, point[1], direction])

      next_point = point.zip(direction).map(&:sum)
      return seen if out_of_bounds(matrix, point)

      symbol = matrix[point.first][point[1]]
      seen << [point.first, point[1], direction]

      return energized(matrix, next_point, direction, seen) if symbol == "."

      if symbol == "|"
        return energized(matrix, next_point, direction, seen) if direction.first == 1
        return energized(matrix, next_point, direction, seen) if direction.first == -1

        variant1 = energized(matrix, [point.first + 1, point[1]], [1, 0], seen)
        variant2 = energized(matrix, [point.first - 1, point[1]], [-1, 0], seen)
        return Set.new([*variant1, *variant2]).to_a
      end

      if symbol == "-"
        return energized(matrix, next_point, direction, seen) if direction[1] == 1
        return energized(matrix, next_point, direction, seen) if direction[1] == -1

        variant1 = energized(matrix, [point.first, point[1] + 1], [0, 1], seen)
        variant2 = energized(matrix, [point.first, point[1] - 1], [0, -1], seen)
        return Set.new([*variant1, *variant2]).to_a
      end

      if symbol == "/"
        return energized(matrix, [point.first, point[1] - 1], [0, -1], seen) if direction.first == 1
        return energized(matrix, [point.first, point[1] + 1], [0, 1], seen) if direction.first == -1
        return energized(matrix, [point.first - 1, point[1]], [-1, 0], seen) if direction[1] == 1
        return energized(matrix, [point.first + 1, point[1]], [1, 0], seen) if direction[1] == -1
      end

      return unless symbol == "x"

      return energized(matrix, [point.first, point[1] + 1], [0, 1], seen) if direction.first == 1
      return energized(matrix, [point.first, point[1] - 1], [0, -1], seen) if direction.first == -1
      return energized(matrix, [point.first + 1, point[1]], [1, 0], seen) if direction[1] == 1

      energized(matrix, [point.first - 1, point[1]], [-1, 0], seen) if direction[1] == -1
    end

    def out_of_bounds(matrix, point)
      point.first >= matrix.size || point.first.negative? || point[1] >= matrix.first.size || point[1].negative?
    end
  end
end
