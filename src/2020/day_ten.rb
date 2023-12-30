# frozen_string_literal: true

class DayTen2020
  def self.part_one(lines)
    middle = (lines.sort.size - lines.max) / 2
    (middle + lines.size) * (1 - middle)
  end

  def self.part_two(lines)
    combinations = [0, 0, 0, 1]
    lines.sort.each { |idx| combinations[idx + 3] = combinations[idx..idx + 2].compact.sum }
    combinations.last
  end
end
