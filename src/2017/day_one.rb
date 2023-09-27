# frozen_string_literal: true

class DayOne2017
  def self.part_one(numbers)
    calculate_catch(numbers, 1)
  end

  def self.part_two(numbers)
    step = numbers.size / 2
    calculate_catch(numbers, step)
  end

  class << self
    def calculate_catch(numbers, step)
      digits = []
      numbers.each_with_index do |number, index|
        next_index = (index + step) % numbers.size
        digits.push(number) if number == numbers[next_index]
      end
      digits.sum
    end
  end
end
