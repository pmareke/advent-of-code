# frozen_string_literal: true

class DayThree2020
  def self.part_one(lines)
    solve(lines).first
  end

  def self.part_two(lines)
    solve(lines).inject(&:*)
  end

  class << self
    def solve(lines)
      pairs = [[1, 3], [1, 1], [1, 5], [1, 7], [2, 1]]
      pairs.inject([]) do |scores, (vertical, horizontal)|
        x = y = 0
        jumps = lines.size / vertical
        scores << jumps.times.inject(0) do |acc, _|
          acc += 1 if lines[x][y] == "#"
          x += vertical
          y += horizontal
          y %= lines.first.size
          acc
        end
      end
    end
  end
end
