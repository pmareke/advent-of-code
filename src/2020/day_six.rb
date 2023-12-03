# frozen_string_literal: true

class DaySix2020
  def self.part_one(lines)
    groups(lines).reduce(0) do |acc, group|
      times = group.each_with_object(Hash.new(0)) do |line, letters|
        line.chars.tally.each { |key, value| letters[key] += value }
        letters
      end
      acc + times.keys.count
    end
  end

  def self.part_two(lines)
    groups(lines).reduce(0) do |acc, group|
      group_size = group.size
      times = group.each_with_object(Hash.new(0)) do |line, letters|
        line.chars.tally.each { |key, value| letters[key] += value }
        letters
      end
      acc + times.count { |_, value| value == group_size }
    end
  end

  class << self
    def groups(lines)
      lines.split("\n\n").map { |group| group.split("\n") }
    end
  end
end
