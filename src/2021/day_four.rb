# frozen_string_literal: true

class DayFour2021
  def self.part_one(numbers, cards)
    solve(numbers, cards).first
  end

  def self.part_two(numbers, cards)
    solve(numbers, cards).last
  end

  class << self
    def solve(numbers, cards)
      numbers = numbers.split(",").map(&:to_i)
      bingo_cards = parse_cards(cards)
      winners = []
      numbers.each_with_object([]) do |number, acc|
        bingo_cards.each_with_index do |bingo_card, index|
          next if winners.include? index

          play(bingo_card, number)
          next unless win? bingo_card

          winners << index
          score = number * bingo_card.sum { |x| x.compact.sum }
          acc << score
        end
        acc
      end
    end

    def parse_cards(cards)
      cards.inject([]) do |acc, card|
        acc << card.split("\n").map { |line| line.split.map(&:to_i) }
      end
    end

    def play(card, number)
      card.each do |column|
        column.each_with_index do |item, idx|
          column[idx] = nil if item == number
        end
      end
    end

    def win?(card)
      return true if card.any? { |column| column.all?(&:nil?) }

      card.transpose.any? { |column| column.all?(&:nil?) }
    end
  end
end
