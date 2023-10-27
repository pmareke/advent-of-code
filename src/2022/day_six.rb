# frozen_string_literal: true

class DaySix2022
  def self.part_one(lines)
    lines.sum { |line| find_index_for_consecutive_letters(line, 4) }
  end

  def self.part_two(lines)
    lines.sum { |line| find_index_for_consecutive_letters(line, 14) }
  end
  class << self
    def find_index_for_consecutive_letters(line, number)
      index = line.chars.each_cons(number).find_index { |c| c.uniq.size == number }
      index + number
    end
  end
end
