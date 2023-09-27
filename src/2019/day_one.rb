# frozen_string_literal: true

class DayOne2019
  def self.part_one(numbers)
    calculate_fuel(numbers)
  end

  def self.part_two(numbers)
    calculate_fuel_recursive(numbers)
  end

  class << self
    def calculate_fuel(numbers)
      numbers
        .map { |element| (element / 3) - 2 }
        .sum
    end

    def calculate_fuel_recursive(numbers)
      numbers
        .map { |number| calculate_all_fuel(number) }
        .sum
    end

    def calculate_all_fuel(element)
      total = 0
      loop do
        element = (element / 3) - 2
        break unless element.positive?

        total += element
      end
      total
    end
  end
end
