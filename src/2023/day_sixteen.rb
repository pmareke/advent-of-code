# frozen_string_literal: true

class DaySixteen2023
  Beam = Struct.new(:pos, :direction)

  def self.part_one(lines)
    grid = lines.reduce([]) { |acc, line| acc << line.chars }
    beam = Beam.new([-1, 0], [1, 0])
    energize(grid, beam)
  end

  def self.part_two(lines)
    grid = lines.reduce([]) { |acc, line| acc << line.chars }
    line_size = grid.first.size
    size = grid.size
    energies = []
    line_size.times.each do |x|
      energies << energize(grid, Beam.new([x, size], [0, -1]))
      energies << energize(grid, Beam.new([x, -1], [0, 1]))
    end
    size.times.each do |y|
      energies << energize(grid, Beam.new([-1, y], [1, 0]))
      energies << energize(grid, Beam.new([line_size, y], [-1, 0]))
    end

    energies.max
  end

  class << self
    def energize(grid, beam)
      visited = Set.new
      energized = Set.new
      queue = [beam]
      until queue.empty?
        beam = queue.shift
        next if visited.include?(beam)

        visited << beam
        energized << beam.pos unless out_of_bounds(grid, beam.pos)
        next_point = beam.pos.zip(beam.direction).map(&:sum)
        next if out_of_bounds(grid, next_point)

        case [beam.direction.first.abs, grid[next_point[1]][next_point.first]]
        when [1, "|"], [0, "-"]
          queue << Beam.new(next_point, [beam.direction[1].abs, beam.direction.first.abs])
          queue << Beam.new(next_point, [beam.direction[1].abs * -1, beam.direction.first.abs * -1])
        when [1, "\\"], [0, "\\"]
          queue << Beam.new(next_point, [beam.direction[1], beam.direction.first])
        when [1, "/"], [0, "/"]
          queue << Beam.new(next_point, [beam.direction[1] * -1, beam.direction[0] * -1])
        else
          queue << Beam.new(next_point, beam.direction)
        end
      end
      energized.size
    end

    def out_of_bounds(matrix, point)
      point.first >= matrix.size || point.first.negative? || point[1] >= matrix.first.size || point[1].negative?
    end
  end
end
