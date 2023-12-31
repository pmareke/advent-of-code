# frozen_string_literal: true

class DayEleven2017
  STEPS = {
    "n" => [0, 1, -1],
    "s" => [0, -1, 1],
    "ne" => [1, 0, -1],
    "sw" => [-1, 0, 1],
    "nw" => [-1, 1, 0],
    "se" => [1, -1, 0],
  }.freeze

  def self.part_one(line)
    line.split(",").reduce([0, 0, 0]) do |point, coordinate|
      point = STEPS[coordinate].zip(point).map(&:sum)
      point
    end.map(&:abs).sum / 2
  end

  def self.part_two(line)
    point = [0, 0, 0]
    line.split(",").each_with_object([]) do |coordinate, acc|
      point = STEPS[coordinate].zip(point).map(&:sum)
      acc << (point.map(&:abs).sum / 2)
    end.max
  end
end
