# frozen_string_literal: true

class DaySix2023
  def self.part_one(lines)
    races = lines.reduce([]) { |acc, line| acc << line.scan(/(?:\d+)/).map(&:to_i) }.transpose
    races.reduce([]) { |acc, race| acc << play(*race) }.reduce(&:*)
  end

  def self.part_two(lines)
    race = lines.reduce([]) { |acc, line| acc << line.scan(/(?:\d+)/).join.to_i }
    # The solution for the first part works also for this one but it takes 2.7s
    # play(*race)
    play_with_formula(*race)
  end

  class << self
    def play(time, record)
      (0..time).count do |millimeters_per_millisecond|
        movement_time = time - millimeters_per_millisecond
        distance = movement_time * millimeters_per_millisecond
        record < distance
      end
    end

    def play_with_formula(time, distance)
      # [Diophantine equation](https://en.wikipedia.org/wiki/Diophantine_equation)
      discriminant = Math.sqrt((time ** 2) - (4 * distance))
      x = (time + discriminant) / 2
      y = (time - discriminant) / 2
      x.floor - y.ceil + 1
    end
  end
end
