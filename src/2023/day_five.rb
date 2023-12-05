# frozen_string_literal: true

require "set"

class DayFive2023
  def self.part_one(lines)
    parts = lines.split("\n\n")
    translations = create_translations(parts[1..])
    seeds = parts.first.scan(/(?:\d+)/).map(&:to_i)
    seeds.reduce([]) do |acc, seed|
      acc << solve_for_one_seed(translations, seed)
    end.min
  end

  def self.part_two(_lines)
    0
  end

  class << self
    def create_translations(parts)
      parts.each_with_object({}) do |group, total|
        title, *locations = group.split("\n")
        title = title.split.first
        locations = locations.each_with_object([]) do |location, acc|
          acc << location.scan(/(?:\d+)/).map(&:to_i)
        end
        total[title] = locations.each_with_object({}) do |location, accumulator|
          destination, source, range = location
          accumulator[(source..source + range)] = (destination..destination + range)
          accumulator
        end
        total
      end
    end

    def solve_for_one_seed(translations, seed)
      translations.each_key do |key|
        range = translations[key].keys.find { |k| k.include? seed }
        next if range.nil?

        difference = seed - range.first
        range = translations[key][range]
        seed = difference + range.first
      end
      seed
    end
  end
end
