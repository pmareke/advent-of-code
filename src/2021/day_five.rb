# frozen_string_literal: true

class DayFive2021
  def self.part_one(coordinates)
    points = Hash.new(0)
    coordinates.each do |coordinate|
      x1, y1, x2, y2 = *coordinate.scan(/(\d+),(\d+) -> (\d+),(\d+)/).first.map(&:to_i)
      minx, maxx = [x1, x2].minmax
      miny, maxy = [y1, y2].minmax

      next unless minx == maxx || miny == maxy

      (minx..maxx).each do |x|
        (miny..maxy).each do |y|
          points["#{x}:#{y}"] += 1
        end
      end
    end

    points.count do |_, value|
      value >= 2
    end
  end

  def self.part_two(coordinates)
    points = Hash.new(0)
    coordinates.each do |coordinate|
      x1, y1, x2, y2 = *coordinate.scan(/(\d+),(\d+) -> (\d+),(\d+)/).first.map(&:to_i)
      minx, maxx = [x1, x2].minmax
      miny, maxy = [y1, y2].minmax
      if minx == maxx || miny == maxy
        (miny..maxy).each do |y|
          (minx..maxx).each do |x|
            points["#{x}:#{y}"] += 1
          end
        end
      else
        start = (x1 - x2).abs + 1
        start.times do |t|
          incrementx = x1 > x2 ? -1 * t : 1 * t
          incrementy = y1 > y2 ? -1 * t : 1 * t
          points["#{x1 + incrementx}:#{y1 + incrementy}"] += 1
        end
      end
    end

    points.count do |_, value|
      value >= 2
    end
  end
end
