# frozen_string_literal: true

class DayThree2021
  def self.part_one(numbers)
    gamma = epsilon = ""
    most_common(numbers).each do |number|
      gamma += number.zero? ? "0" : "1"
      epsilon += number.zero? ? "1" : "0"
    end
    gamma.to_i(2) * epsilon.to_i(2)
  end

  def self.part_two(numbers)
    oxygen = find_number(numbers, 0, ->(x, y) { x == y })
    co2 = find_number(numbers, 0, ->(x, y) { x != y })
    oxygen.to_i(2) * co2.to_i(2)
  end

  class << self
    def find_number(numbers, start, callback)
      return numbers.first if numbers.size == 1

      most_common = most_common(numbers)
      valid_numbers = numbers.filter do |number|
        callback.call(number[start].to_i, most_common[start])
      end
      find_number(valid_numbers, start + 1, callback)
    end

    def most_common(numbers)
      digits = numbers.map(&:chars)
      digits.to_a.transpose.inject([]) do |acc, line|
        group = line.join.chars.tally
        zeros = group.fetch("0", 0)
        ones = group.fetch("1", 0)
        epsilon_score = zeros > ones ? 0 : 1
        acc << epsilon_score
      end
    end
  end
end
