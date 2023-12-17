# frozen_string_literal: true

class DaySeven2021
  def self.part_one(line)
    numbers = line.split(",").map(&:to_i)
    numbers.max.times.reduce([]) do |acc, i|
      acc << numbers.sum { |number| (number - i).abs }
    end.min
  end

  def self.part_two(line)
    numbers = line.split(",").map(&:to_i)
    numbers.max.times.reduce([]) do |acc, i|
      acc << numbers.sum do |number|
        abs = (number - i).abs
        abs * (abs + 1) / 2
      end
    end.min
  end
end
