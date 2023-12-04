# frozen_string_literal: true

class DayFour2023
  def self.part_one(lines)
    lines.reduce(0) do |acc, line|
      winners = line.scan(/(?:\d+)/)[1..].tally.count { |_, value| value == 2 }
      points = winners.zero? ? 0 : (2**winners.pred)
      acc + points
    end
  end

  def self.part_two(lines)
    cards = lines.each_with_object({}) do |line, acc|
      id, *numbers = line.scan(/(?:\d+)/)
      winners = numbers.tally.values.count { |value| value == 2 }
      acc[id] = winners
      acc
    end

    results = cards.each_with_object({}) do |(key, value), acc|
      start = key.to_i
      finish = start + value
      acc[start] = []
      (start..finish).each { |card| acc[start] << card }
      acc
    end

    results.values.flatten.tally.keys.each_with_object(Hash.new(0)) do |key, acc|
      results[key].each { |card| acc[card] += key == card ? 1 : acc[key] }
      acc
    end.values.sum
  end
end
