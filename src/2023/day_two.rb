# frozen_string_literal: true

class DayTwo2023
  def self.part_one(games)
    games.sum do |game|
      id, plays = game.split(": ").flatten
      id = id.scan(/\d+/).map(&:to_i).first
      cubes = plays.scan(/(\d+) (\w+)/)
      valid?(cubes) ? id : 0
    end
  end

  def self.part_two(games)
    games.sum do |game|
      plays = game.split(": ").last
      cubes = plays.scan(/(\d+) (\w+)/)
      calculate_power(cubes)
    end
  end

  class << self
    RULES = { red: 12, green: 13, blue: 14 }.freeze

    def valid?(cubes)
      cubes.all? { |value, color| value.to_i <= RULES[color.to_sym] }
    end

    def calculate_power(cubes)
      score = cubes.each_with_object({}) do |(value, color), acc|
        current_value = acc[color.to_sym] || 0
        acc[color.to_sym] = [current_value, value.to_i].max
        acc
      end

      score.values.reduce(&:*)
    end
  end
end
