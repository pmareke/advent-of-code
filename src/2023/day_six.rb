# frozen_string_literal: true

class DaySix2023
  def self.part_one(lines)
    races = lines.reduce([]) { |acc, line| acc << line.scan(/(?:\d+)/).map(&:to_i) }.transpose
    races.reduce([]) { |acc, race| acc << play(*race) }.reduce(&:*)
  end

  def self.part_two(lines)
    race = lines.reduce([]) { |acc, line| acc << line.scan(/(?:\d+)/).join.to_i }
    play(*race)
  end

  class << self
    def play(time, record)
      (0..time).count do |millimeters_per_millisecond|
        movement_time = time - millimeters_per_millisecond
        distance = movement_time * millimeters_per_millisecond
        record < distance
      end
    end
  end
end
