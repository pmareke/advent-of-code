# frozen_string_literal: true

class DayFive2020
  def self.part_one(lines)
    seats(lines).max
  end

  def self.part_two(lines)
    seats(lines).sort.each_cons(2) do |x, y|
      return x.next if x.next != y
    end
  end

  class << self
    def seats(lines)
      lines.inject([]) do |acc, line|
        line = line.strip.tr("B|R", "1").tr("F|L", "0")
        row = line[0..6].to_i(2)
        column = line[7..9].to_i(2)
        acc << ((row * 8) + column)
      end
    end
  end
end
