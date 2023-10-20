# frozen_string_literal: true

class DayThree2017
  def self.part_one(target)
    dimension = Math.sqrt(target).ceil
    grid = Array.new(dimension) { Array.new(dimension) }
    start = dimension / 2
    point_x = point_y = start
    dirs = %i[right up left down]
    dir = dirs[0]

    (target - 1).times do |i|
      grid[point_y][point_x] = i + 1

      next_dir = dirs[(dirs.index(dir) + 1) % dirs.length]
      point_x1, point_y1 = move(point_x, point_y, next_dir)
      dir = next_dir if grid[point_y1][point_x1].nil?

      point_x, point_y = move(point_x, point_y, dir)
    end

    (point_x - start).abs + (point_y - start).abs
  end

  def self.part_two(target)
    dimension = Math.sqrt(target).ceil
    grid = Array.new(dimension) { Array.new(dimension) }
    start = dimension / 2
    point_x = point_y = start
    dirs = %i[right up left down]
    dir = dirs[0]

    target.times do |_|
      product = [point_x - 1, point_x, point_x + 1].product([point_y - 1, point_y, point_y + 1])
      value = product.map { |x, y| grid[y][x] }.compact.inject(:+)

      value ||= 1
      grid[point_y][point_x] = value

      break if value > target

      next_dir = dirs[(dirs.index(dir) + 1) % dirs.length]
      point_x1, point_y1 = move(point_x, point_y, next_dir)
      dir = next_dir if grid[point_y1][point_x1].nil?

      point_x, point_y = move(point_x, point_y, dir)
    end

    grid[point_y][point_x]
  end

  class << self
    def move(point_x, point_y, direction)
      case direction
      when :right
        point_x += 1
      when :up
        point_y -= 1
      when :left
        point_x -= 1
      when :down
        point_y += 1
      end

      [point_x, point_y]
    end
  end
end
