# frozen_string_literal: true

class DayFourteen2023
  def self.part_one(lines)
    mirrors = lines.each_with_object([]) do |line, acc|
      acc << line.chars
    end
    mirrors_to_north = move_mirrors_to_north(mirrors)
    calculate_load(mirrors_to_north)
  end

  def self.part_two(_lines)
    0
  end

  class << self
    def move_mirrors_to_north(mirrors)
      line_size = mirrors.first.size
      total_size = mirrors.size
      line_size.times do |idx|
        total_size.times do |_|
          total_size.times do |idy|
            next unless idy.positive?

            if mirrors[idy][idx] == "O" && mirrors[idy - 1][idx] == "."
              mirrors[idy][idx] = "."
              mirrors[idy - 1][idx] = "O"
            end
          end
        end
      end
      mirrors
    end

    def calculate_load(mirrors_to_north)
      mirrors_to_north.each_with_index.sum do |row, index|
        rounded_rocks = row.count { |mirror| mirror == "O" }
        (mirrors_to_north.size - index) * rounded_rocks
      end
    end
  end
end
