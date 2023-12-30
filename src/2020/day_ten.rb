# frozen_string_literal: true

class DayTen2020
  def self.part_one(lines)
    max = lines.max
    [0, *lines.sort, max + 3].each_cons(2).with_object([]) do |(x, y), acc|
      acc << (y - x)
    end.tally.values.reduce(&:*)
  end

  def self.part_two(lines)
    combinations = [0, 0, 0, 1]
    lines.sort.each { |idx| combinations[idx + 3] = combinations[idx..idx + 2].compact.sum }
    combinations.last
  end
end
