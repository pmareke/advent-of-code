# frozen_string_literal: true

class DayNine2015
  def self.part_one(lines)
    calculate_distances(lines).min
  end

  def self.part_two(lines)
    calculate_distances(lines).max
  end

  class << self
    def calculate_distances(lines)
      cities = Set.new
      distances = lines.each_with_object({}) do |line, acc|
        from, to, distance = line.scan(/(?:(\w+) to (\w+) = (\d+))/).first
        acc[[from, to].sort] = distance.to_i
        cities << from
        cities << to
      end
      cities.to_a.permutation.reduce([]) do |acc, places|
        acc << places.each_cons(2).sum do |from, to|
          distances[[from, to].sort]
        end
      end
    end
  end
end
