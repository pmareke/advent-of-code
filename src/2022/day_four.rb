# frozen_string_literal: true

class DayFour2022
  def self.part_one(lines)
    lines.count do |line|
      first_section, second_section = calculate_ranges line
      left_completely_include = first_section.all? { |item| second_section.include? item }
      right_completely_include = second_section.all? { |item| first_section.include? item }
      [left_completely_include, right_completely_include].any?
    end
  end

  def self.part_two(lines)
    lines.count do |line|
      first_section, second_section = calculate_ranges line
      left_partially_include = first_section.any? { |item| second_section.include? item }
      right_partially_include = second_section.any? { |item| first_section.include? item }
      [left_partially_include, right_partially_include].any?
    end
  end

  class << self
    def calculate_ranges(line)
      left, right = line.split(",")
      first, last = left.split("-").map(&:to_i)
      first_section = (first..last)
      first, last = right.split("-").map(&:to_i)
      second_section = (first..last)
      [first_section, second_section]
    end
  end
end
