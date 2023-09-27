# frozen_string_literal: true

require "set"

class DayThree2015
  def self.part_one(instructions)
    point_x = point_y = 0
    seen = Set[[point_x, point_y]]
    instructions.each do |instruction|
      point_x, point_y = update_position(instruction, point_x, point_y)
      pair = [point_x, point_y]
      seen.add(pair)
    end
    seen.count
  end

  def self.part_two(instructions)
    point_x = point_x1 = point_y = point_y1 = 0
    seen = Set[[point_x, point_y]]
    instructions.each_slice(2) do |instruction, neighbour|
      point_x, point_y = update_position(instruction, point_x, point_y)
      pair = [point_x, point_y]
      seen.add(pair)
      point_x1, point_y1 = update_position(neighbour, point_x1, point_y1)
      pair = [point_x1, point_y1]
      seen.add(pair)
    end
    seen.count
  end

  class << self
    def update_position(instruction, point_x, point_y)
      case instruction
      when "^"
        [point_x + 1, point_y]
      when "v"
        [point_x - 1, point_y]
      when ">"
        [point_x, point_y + 1]
      else
        [point_x, point_y - 1]
      end
    end
  end
end
