# frozen_string_literal: true

class DayThree2022
  def self.part_one(lines)
    lines.sum do |line|
      left, right = line.chars.each_slice(line.size / 2).map(&:join)
      letter = left.chars.find { |l| right.include? l }
      score_for letter
    end
  end

  def self.part_two(lines)
    lines.each_slice(3).inject(0) do |acc, blocks|
      left, centre, right = blocks
      candidates = left.chars.filter { |l| centre.include? l }
      letter = right.chars.find { |l| candidates.include? l }
      acc + score_for(letter)
    end
  end

  class << self
    def score_for(letter)
      [*("a".."z"), *("A".."Z")].index(letter) + 1
    end
  end
end
