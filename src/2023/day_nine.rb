# frozen_string_literal: true

class DayNine2023
  def self.part_one(lines)
    lines.sum do |line|
      digits = line.split.map(&:to_i)
      numbers = prediction([digits])
      numbers[1..].reverse.each_cons(2) do |(x, y)|
        y.push(y.last + x.last)
      end
      next_digit = numbers[1].last
      digits.last + next_digit
    end
  end

  def self.part_two(lines)
    lines.sum do |line|
      digits = line.split.map(&:to_i)
      numbers = prediction([digits])
      numbers[1..].reverse.each_cons(2) do |(x, y)|
        y.unshift(y.first - x.first)
      end
      next_digit = numbers[1].first
      digits.first - next_digit
    end
  end

  class << self
    def prediction(numbers)
      return numbers if numbers.last.all?(&:zero?)

      prediction(numbers << numbers.last.each_cons(2).map { |x, y| y - x })
    end
  end
end
