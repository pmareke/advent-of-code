# frozen_string_literal: true

class DayTwo2017
  def self.part_one(lines)
    lines.sum do |numbers|
      numbers.map(&:strip).map(&:to_i).minmax.reduce(&:-).abs
    end
  end

  def self.part_two(lines)
    lines.sum do |numbers|
      numbers = numbers.map(&:strip).map(&:to_i)
      numbers.permutation(2).find { |a, b| (a % b).zero? }.reduce(:/)
    end
  end
end
