# frozen_string_literal: true

class DayOne2021
  def self.part_one(numbers)
    calculate(numbers)
  end

  def self.part_two(numbers)
    calculate(numbers, limit: 4)
  end

  class << self
    def calculate(numbers, limit: 2)
      numbers
        .each_cons(limit)
        .count { |element| element[0] < element[limit - 1] }
    end
  end
end
