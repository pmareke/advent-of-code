# frozen_string_literal: true

require "set"

class DayOne2018
  def self.part_one(numbers)
    numbers.map(&:to_i).sum
  end

  def self.part_two(numbers)
    seen = Set[]
    frequency = 0
    loop do
      numbers.each do |number|
        frequency += number
        return frequency if seen.include?(frequency)

        seen.add(frequency)
      end
    end
  end
end
