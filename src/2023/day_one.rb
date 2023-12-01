# frozen_string_literal: true

class DayOne2023
  def self.part_one(lines)
    lines.sum do |line|
      digits = line.scan(/\d/)
      first = digits.first
      last = digits.last
      "#{first}#{last}".to_i
    end
  end

  def self.part_two(lines)
    numbers = %w[one two three four five six seven eight nine]
    lines.sum do |line|
      digits = line.scan(/(?=(one|two|three|four|five|six|seven|eight|nine|\d))/).flatten
      first = numbers.index(digits.first)&.next || digits.first
      last = numbers.index(digits.last)&.next || digits.last
      "#{first}#{last}".to_i
    end
  end
end
