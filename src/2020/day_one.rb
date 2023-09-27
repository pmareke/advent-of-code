# frozen_string_literal: true

class DayOne2020
  def self.part_one(numbers)
    calculate(numbers)
  end

  def self.part_two(numbers)
    calculate(numbers, limit: 3)
  end

  class << self
    def calculate(numbers, limit: 2)
      numbers
        .permutation(limit)
        .filter { |element| element.sum == 2020 }
        .map { |element| element.inject(1, :*) }
        .first
    end
  end
end
