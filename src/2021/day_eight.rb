# frozen_string_literal: true

class DayEight2021
  def self.part_one(lines)
    lines.sum do |line|
      line.split(" | ").last.split.count { |digits| [2, 3, 4, 7].include? digits.size }
    end
  end

  def self.part_two(lines)
    lines.map do |line|
      input, output = line.split(" | ")
      input = input.split.map { |c| c.chars.sort }
      output = output.split.map { |c| c.chars.sort }
      mapping = deduce_mapping(input)
      output.map { |digit| mapping.key(digit) }.join.to_i
    end.sum
  end

  class << self
    def deduce_mapping(input)
      mapping = {}

      mapping[1] = input.find { |p| p.size == 2 }
      mapping[7] = input.find { |p| p.size == 3 }
      mapping[4] = input.find { |p| p.size == 4 }
      mapping[8] = input.find { |p| p.size == 7 }
      mapping[6] = input.find { |p| p.size == 6 && (p - mapping[1]).size == 5 }
      mapping[9] = input.find { |p| p.size == 6 && (p - mapping[4]).size == 2 }
      mapping[0] = input.find { |p| p.size == 6 && p != mapping[6] && p != mapping[9] }
      mapping[3] = input.find { |p| p.size == 5 && (p - mapping[1]).size == 3 }
      mapping[2] = input.find { |p| p.size == 5 && (p - mapping[9]).size == 1 }
      mapping[5] = input.find { |p| p.size == 5 && p != mapping[2] && p != mapping[3] }

      mapping
    end
  end
end
