# frozen_string_literal: true

class DayTwo2021
  def self.part_one(lines)
    horizontal = depth = 0
    lines.each do |line|
      position, steps = line
      case position
      when "up"
        depth -= steps.to_i
      when "down"
        depth += steps.to_i
      else
        horizontal += steps.to_i
      end
    end
    horizontal * depth
  end

  def self.part_two(lines)
    aim = horizontal = depth = 0
    lines.each do |line|
      position, steps = line
      case position
      when "up"
        aim -= steps.to_i
      when "down"
        aim += steps.to_i
      else
        horizontal += steps.to_i
        depth += aim * steps.to_i
      end
    end
    horizontal * depth
  end
end
