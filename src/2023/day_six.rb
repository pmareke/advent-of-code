# frozen_string_literal: true

Race = Data.define(:time, :distance)

class DaySix2023
  def self.part_one(lines)
    races = lines.each_with_object([]) do |line, acc|
      points = line.scan(/(?:\d+)/).map(&:to_i)
      acc << points
    end.transpose

    wins = races.each_with_object([]) do |race, acc|
      acc << play(*race)
    end
    
    wins.reduce(&:*)
  end

  def self.part_two(lines)
    race = lines.each_with_object([]) do |line, acc|
      points = line.scan(/(?:\d+)/)
      acc << points.join.to_i
    end
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
