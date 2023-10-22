# frozen_string_literal: true

class DayFour2019
  def self.part_one(numbers)
    first, last = numbers.split("-").map(&:to_i)
    (first..last).count { |number| valid?(number.to_s) }
  end

  def self.part_two(numbers)
    first, last = numbers.split("-").map(&:to_i)
    (first..last).count { |number| valid_part_two?(number.to_s) }
  end

  class << self
    def valid?(number)
      ocurrences = number.chars.each_with_object(Hash.new(0)) do |digit, acc|
        acc[digit] += 1
        acc
      end
      crescent?(number) && ocurrences.values.any? { |value| value >= 2 }
    end

    def valid_part_two?(number)
      ocurrences = number.chars.each_with_object(Hash.new(0)) do |digit, acc|
        acc[digit] += 1
        acc
      end
      crescent?(number) && ocurrences.values.any? { |value| value == 2 }
    end

    def crescent?(number)
      number.chars == number.chars.sort
    end
  end
end
