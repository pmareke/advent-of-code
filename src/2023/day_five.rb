# frozen_string_literal: true

require "set"

class DayFive2023
  def self.part_one(lines)
    parts = lines.split("\n\n")
    seeds = parts.first.scan(/(?:\d+)/).map(&:to_i)
    translations = create_translations(parts[1..])
    seeds.reduce([]) do |acc, seed|
      translations.each do |translation|
        seed = solve_for_one_seed(translation, seed)
      end
      acc << seed
    end.min
  end

  def self.part_two(lines)
    parts = lines.split("\n\n")
    seeds = parts.first.scan(/(?:\d+)/).map(&:to_i).each_slice(2).to_a
    translations = create_translations(parts[1..])
    seeds.each_with_object([]) do |seed, acc|
      ranges = [[seed.first, seed.sum]]
      translations.each do |translation|
        ranges = solve_for_ranges(translation, ranges)
      end
      acc << ranges.min.first
    end.min
  end

  class << self
    def create_translations(parts)
      parts.each_with_object([]) do |group, total|
        _, *locations = group.split("\n")
        total << locations.each_with_object([]) do |location, acc|
          acc << location.scan(/(?:\d+)/).map(&:to_i)
        end
        total
      end
    end

    def solve_for_one_seed(translation, seed)
      translation.each do |points|
        destination, source, size = points
        return destination + seed - source if source <= seed && seed < source + size
      end
      seed
    end

    def solve_for_ranges(translation, range)
      ranges = []
      translation.each do |destination, source, size|
        new_source = source + size
        new_ranges = []
        until range.empty?
          range_start, range_end = range.pop
          before = [range_start, [range_end, source].min]
          inter = [[range_start, source].max, [new_source, range_end].min]
          after = [[new_source, range_start].max, range_end]

          new_ranges.append(before) if before[1] > before.first
          ranges.append([inter.first - source + destination, inter[1] - source + destination]) if inter[1] > inter.first
          new_ranges.append(after) if after[1] > after.first
        end
        range = new_ranges
      end
      ranges + range
    end
  end
end
