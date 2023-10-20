# frozen_string_literal: true

class DayFour2017
  def self.part_one(lines)
    lines.count { valid? _1 }
  end

  def self.part_two(lines)
    lines.count { valid_with_anagrams? _1 }
  end

  class << self
    def valid?(line)
      words = line.scan(/(\w+)/)
      words.tally.values.all? { |value| value == 1 }
    end

    def valid_with_anagrams?(line)
      words = line.scan(/(\w+)/)
      words.flatten.map { _1.chars.sort }.tally.values.all? { _1 == 1 }
    end
  end
end
