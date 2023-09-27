# frozen_string_literal: true

class DayOne2022
  def self.part_one(groups)
    calculate(groups)
  end

  def self.part_two(groups)
    calculate(groups, 3)
  end

  class << self
    def calculate(groups, limit = 1)
      groups
        .map { |group| calculate_sum_for group }
        .sort
        .last(limit)
        .sum
    end

    def calculate_sum_for(group)
      group
        .split("
")
        .map(&:to_i)
        .sum
    end
  end
end
