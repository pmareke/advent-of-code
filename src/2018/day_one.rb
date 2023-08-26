require "set"

class DayOne2018
  def self.part_one(numbers)
    numbers.map(&:to_i).sum
  end

  def self.part_two(numbers)
    seen = Set[]
    frequency = 0
    while true
      for number in numbers
        frequency += number
        if seen.include?(frequency)
          return frequency
        end
        seen.add(frequency)
      end
    end
  end
end
