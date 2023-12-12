# frozen_string_literal: true

require_relative "models/spring"

class DayTwelve2023
  def self.part_one(lines)
    lines.each_with_object([]) do |line, acc|
      springs, groups = line.split
      groups = groups.split(",").map(&:to_i)

      acc << Spring.new(springs, groups)
    end.sum(&:arrangements)
  end

  def self.part_two(lines)
    lines.each_with_object([]) do |line, acc|
      springs, groups = line.split
      springs = ([springs] * 5).join("?")
      groups = groups.split(",").map(&:to_i) * 5

      acc << Spring.new(springs, groups)
    end.sum(&:arrangements)
  end
end
