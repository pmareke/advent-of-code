# frozen_string_literal: true

class DayFour2023
  def self.part_one(lines)
    lines.sum do |line|
      winners = line.scan(/(?:\d+)/)[1..].tally.values.count { |value| value == 2 }
      winners.zero? ? 0 : 2 ** winners.pred
    end
  end

  def self.part_two(lines)
    cards_with_winners = lines.each_with_object({}) do |line, acc|
      id, *numbers = line.scan(/(?:\d+)/)
      winners = numbers.tally.values.count { |value| value == 2 }
      acc[id] = winners
    end

    cards = cards_with_winners.each_with_object({}) do |(key, value), acc|
      start = key.to_i
      finish = start + value
      acc[start] = []
      (start..finish).each { |card| acc[start] << card }
      acc
    end

    cards.values.flatten.tally.keys.each_with_object(Hash.new(0)) do |key, acc|
      cards[key].each { |card| acc[card] += key == card ? 1 : acc[key] }
      acc
    end.values.sum
  end
end
