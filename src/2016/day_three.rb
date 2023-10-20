# frozen_string_literal: true

class DayThree2016
  def self.part_one(lines)
    lines.count do |line|
      sides = line.strip.scan(/(\d+)\s*(\d+)\s*(\d+)/).flatten.compact.map(&:to_i)
      valid? sides
    end
  end

  def self.part_two(lines)
    triangles = lines.map do |line|
      line.strip.scan(/(\d+)\s*(\d+)\s*(\d+)/).flatten.compact.map(&:to_i)
    end

    triangles.each_cons(3).inject(0) do |acc, (first, second, third)|
      first.size.times do |_|
        acc += 1 if valid? [first.pop, second.pop, third.pop]
      end
      acc
    end
  end

  class << self
    def valid?(sides)
      sides.permutation.all? { |x, y, z| x < y + z }
    end
  end
end
