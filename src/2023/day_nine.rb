# frozen_string_literal: true

class DayNine2023
  def self.part_one(lines)
    lines.sum do |line|
      digits = line.split.map(&:to_i)
      calculate_prediction(digits).last
    end
  end

  def self.part_two(lines)
    lines.sum do |line|
      digits = line.split.map(&:to_i)
      calculate_prediction(digits).first
    end
  end

  class << self
    def calculate_prediction(digits)
      matrix = prediction([digits])
      matrix.reverse.each_cons(2) do |(x, y)|
        y.unshift(y.first - x.first)
        y.push(y.last + x.last)
      end
      matrix.first
    end

    def prediction(numbers)
      return numbers if numbers.last.all?(&:zero?)

      prediction(numbers << numbers.last.each_cons(2).map { |x, y| y - x })
    end
  end
end
