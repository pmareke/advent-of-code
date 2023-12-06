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
      time.times.count do |millimeters_per_millisecond|
        movement_time = time - millimeters_per_millisecond
        distance = movement_time * millimeters_per_millisecond
        record < distance
      end
    end

    def play_with_formula(time, distance)
      # Quadratic equation
      # x * (time - x) = distance
      # -x^2 + time*x - distance = 0
      # x = (-time +- sqrt(time^2 - 4*a*distance)) / 2a
      a = -1

      x = (-time + Math.sqrt((time ** 2) + (4 * a * distance))) / (2 * a)

      min_losing_time = x.ceil - 1
      total_losing_times = (min_losing_time * 2) + 1
      time - total_losing_times
    end
  end
end
