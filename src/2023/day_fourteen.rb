# frozen_string_literal: true

class DayFourteen2023
  def self.part_one(lines)
    mirrors = lines.each_with_object([]) { |line, acc| acc << line.chars }
    mirrors = move_mirrors(mirrors)
    calculate_load(mirrors)
  end

  def self.part_two(lines)
    mirrors = lines.each_with_object([]) { |line, acc| acc << line.chars }
    cache = []
    cycles = 1_000_000_000
    cycles.times do |_|
      mirrors = cycle(mirrors)
      load = calculate_load(mirrors)
      cache << load
      size = cache[..-2].rindex(load)
      cache_size = cache.size - 1
      next unless size && cache[size..-2] == cache[(2 * size) - cache_size...size]

      cache_size -= size
      return cache[size + ((cycles + ~size) % cache_size)]
    end
  end

  class << self
    def move_mirrors(mirrors)
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

    def cycle(mirrors)
      4.times.reduce(mirrors) do |acc, _|
        move_mirrors(acc).reverse.transpose
      end
    end

    def calculate_load(mirrors_to_north)
      mirrors_to_north.each_with_index.sum do |row, index|
        rounded_rocks = row.count { |mirror| mirror == "O" }
        (mirrors_to_north.size - index) * rounded_rocks
      end
    end
  end
end
