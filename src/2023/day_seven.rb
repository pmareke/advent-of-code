# frozen_string_literal: true

require_relative "models/hand"

class DaySeven2023
  def self.part_one(lines)
    solve(lines)
  end

  def self.part_two(lines)
    solve(lines, part_two: true)
  end

  class << self
    def solve(lines, part_two: false)
      hands = lines.reduce([]) do |acc, line|
        cards, bid = line.split
        acc << Hand.new(cards.chars, bid, part_two:)
      end

      hands.sort.each_with_index.reduce([]) { |acc, (hand, index)| acc << (hand.bid * index.next) }.reduce(&:+)
    end
  end
end
