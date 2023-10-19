# frozen_string_literal: true

class DayThree2018
  def self.part_one(lines)
    seen = Hash.new(0)
    lines.each do |line|
      _id, x, y, height, width = parse(line)
      width.times do |w|
        height.times do |h|
          seen["#{x + h}:#{y + w}"] += 1
        end
      end
    end
    seen.count { |_, value| value > 1 }
  end

  def self.part_two(lines)
    points = {}
    points_per_id = {}
    lines.each do |line|
      point_id, x, y, height, width = parse(line)
      points_per_id[point_id] = width * height
      width.times do |w|
        height.times do |h|
          point = "#{x + h}:#{y + w}"
          if points.key? point
            points.delete(point)
          else
            points[point] = point_id
          end
        end
      end
    end
    points
      .group_by { _2 }
      .filter { |id, id_points| points_per_id[id] == id_points.size }
      .flatten
      .first
  end

  class << self
    def parse(line)
      line.scan(/#(\d+) @ (\d+),(\d+): (\d+)x(\d+)/).flatten.map(&:to_i)
    end
  end
end
