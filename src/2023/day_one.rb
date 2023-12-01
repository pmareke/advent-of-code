# frozen_string_literal: true

class DayOne2023
  def self.part_one(lines)
    lines.sum do |line|
      digits = line.strip.scan(/\d/)
      first = digits.first
      last = digits.last
      "#{first}#{last}".to_i
    end
  end

  def self.part_two(lines)
    numbers = %w[one two three four five six seven eight nine]
    lines.sum do |line|
      digits = line.strip.scan(/(?=(one|two|three|four|five|six|seven|eight|nine|\d))/).flatten
      first = numbers.include?(digits.first) ? (numbers.index(digits.first) + 1) : digits.first.to_i
      last = numbers.include?(digits.last) ? (numbers.index(digits.last) + 1) : digits.last.to_i
      "#{first}#{last}".to_i
    end
  end
end
