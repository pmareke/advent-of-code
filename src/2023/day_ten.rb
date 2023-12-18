# frozen_string_literal: true

class DayTen2023
  def self.part_one(lines)
    maze, starting_point = create_maze(lines)
    valid_neighbords = find_valid_neightbords(maze, starting_point)

    neighbords = valid_neighbords.each_with_object({}) do |(idx, idy), acc|
      acc.merge! walk_the_maze(maze, [idx, idy], starting_point, acc)
    end

    neighbords.values.max
  end

  def self.part_two(lines)
    maze, starting_point = create_maze(lines)
    valid_neighbords = find_valid_neightbords(maze, starting_point)

    neighbords = valid_neighbords.each_with_object({}) do |(idx, idy), acc|
      acc.merge! walk_the_maze(maze, [idx, idy], starting_point, acc)
    end

    points = neighbords.keys
    calculate_interior_points([points.last, *points], points.size)
  end

  class << self
    def create_maze(lines)
      starting_point = [0, 0]
      maze = lines.each_with_index.with_object([]) do |(line, index), acc|
        points = line.chars
        if points.include? "S"
          row = points.find_index("S")
          starting_point = [index, row]
        end
        acc << points
      end
      [maze, starting_point]
    end

    def walk_the_maze(maze, point, last_point, acc)
      steps = 1
      seen = {}
      loop do
        acc[point] = acc.key?(point) ? [acc[point], steps].min : steps
        idx, idy = point
        point = maze[idx][idy]

        if point == "S"
          seen[[idx, idy]] = 0
          return seen
        end

        case point
        when "|"
          x = last_point.first > idx ? idx - 1 : idx + 1
          y = idy
        when "-"
          x = idx
          y = last_point[1] > idy ? idy - 1 : idy + 1
        when "L"
          x = last_point.first == idx ? idx - 1 : idx
          y = last_point.first == idx ? idy : idy + 1
        when "F"
          x = last_point.first == idx ? idx + 1 : idx
          y = last_point.first == idx ? idy : idy + 1
        when "J"
          x = last_point.first == idx ? idx - 1 : idx
          y = last_point.first == idx ? idy : idy - 1
        when "7"
          x = last_point.first == idx ? idx + 1 : idx
          y = last_point.first == idx ? idy : idy - 1
        end
        last_point = [idx, idy]
        point = [x, y]
        steps += 1
      end
      acc
    end

    def find_valid_neightbords(maze, starting_point)
      [1, 0, -1].each_with_object([]) do |idx, acc|
        [1, 0, -1].each do |idy|
          next if idx.abs == idy.abs
          next if (starting_point.first + idx).negative?
          next if (starting_point[1] + idy).negative?

          symbol = maze[starting_point.first + idx][starting_point[1] + idy]
          next if symbol == "."

          neighbord = [starting_point.first + idx, starting_point[1] + idy]
          acc << neighbord if neighbord.first > starting_point.first && ["|", "7"].include?(symbol)
          acc << neighbord if neighbord.first < starting_point.first && ["|", "L", "F"].include?(symbol)
          acc << neighbord if neighbord[1] > starting_point[1] && ["-", "7", "J"].include?(symbol)
          acc << neighbord if neighbord[1] < starting_point[1] && ["-", "F", "L"].include?(symbol)
        end
      end
    end

    def calculate_interior_points(interior, exterior)
      calculate_polygon_area(interior) - (0.5 * exterior) + 1
    end

    def calculate_polygon_area(vertices)
      (0.5 * vertices.each_cons(2).sum { |x, y| (x.first * y[1]) - (x[1] * y.first) }.abs).to_i
    end
  end
end
