# frozen_string_literal: true

class DayNine2016
  def self.part_one(line)
    size = 0
    line = line.chars
    until line.empty?
      unless line.shift == "("
        size += 1
        next
      end
      idx = line.index(")").next
      items, times = line.shift(idx).join.split("x").map(&:to_i)
      size += items * times
      line.shift(items)
    end
    size
  end

  def self.part_two(line)
    solve(line.chars)
  end

  class << self
    def solve(line)
      size = 0
      until line.empty?
        unless line.shift == "("
          size += 1
          next
        end
        idx = line.index(")").next
        items, times = line.shift(idx).join.split("x").map(&:to_i)
        size += solve(line[0..items - 1]) * times
        line.shift(items)
      end
      size
    end
  end
end
