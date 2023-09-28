# frozen_string_literal: true

class DayTwo2020
  def self.part_one(lines)
    lines.count { |line| valid? line }
  end

  def self.part_two(lines)
    lines.count { |line| extra_valid? line }
  end

  class << self
    def valid?(line)
      regex = /(\d+)-(\d+) (\w): (\w+)/
      match_data = line.match(regex)
      first, second, character, password = match_data[1..4]
      group = password.chars.tally
      (first.to_i..second.to_i).include? group[character]
    end

    def extra_valid?(line)
      regex = /(\d+)-(\d+) (\w): (\w+)/
      match_data = line.match(regex)
      first, second, character, password = match_data[1..4]
      target = [password[first.to_i - 1], password[second.to_i - 1]]
      target.one? character
    end
  end
end
