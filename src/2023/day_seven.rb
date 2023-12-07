# frozen_string_literal: true

module HandType
  FIVE_OF_A_KIND = 7
  FOUR_OF_A_KIND = 6
  FULL_HOUSE = 5
  THREE_OF_A_KIND = 4
  TWO_PAIR = 3
  ONE_PAIR = 2
  HIGH_CARD = 1
end

class DaySeven2023
  def self.part_one(lines)
    hands = lines.reduce([]) do |acc, line|
      cards, bid = line.split
      type = find_hand_type(cards.chars)
      acc << [type, cards, bid.to_i]
    end

    cards_strength = %w[A K Q J T 9 8 7 6 5 4 3 2]
    sorted_hands = hands.sort { |h1, h2| compare(h1, h2, cards_strength) }

    sorted_hands.each_with_index.reduce([]) do |acc, (hand, index)|
      acc << (hand[2] * index.next)
    end.reduce(&:+)
  end

  def self.part_two(lines)
    hands = lines.reduce([]) do |acc, line|
      cards, bid = line.split
      type = find_hand_type_part_two(cards.chars)
      acc << [type, cards, bid.to_i]
    end

    cards_strength = %w[A K Q T 9 8 7 6 5 4 3 2 J]
    sorted_hands = hands.sort { |h1, h2| compare(h1, h2, cards_strength) }

    sorted_hands.each_with_index.reduce([]) do |acc, (hand, index)|
      acc << (hand[2] * index.next)
    end.reduce(&:+)
  end

  class << self
    def find_hand_type(cards)
      # Five of a kind, where all five cards have the same label.
      return HandType::FIVE_OF_A_KIND if cards.uniq.size == 1

      # One pair, where two cards share one label, and the other three cards have a different label.
      return HandType::ONE_PAIR if cards.uniq.size == 4

      # All cards' labels are distinct.
      return HandType::HIGH_CARD if cards.uniq.size == cards.size

      group_by_letter = cards.tally

      # Three cards have the same label, and the remaining two cards share a different label
      return HandType::FULL_HOUSE if group_by_letter.values.sort == [2, 3]

      # Four cards have the same label and one card has a different label
      return HandType::FOUR_OF_A_KIND if group_by_letter.values.sort == [1, 4]

      # Two cards share one label, two other cards share a second label
      return HandType::TWO_PAIR if group_by_letter.values.sort == [1, 2, 2]

      # Three cards have the same label, and the remaining two cards are each different
      HandType::THREE_OF_A_KIND if group_by_letter.values.sort == [1, 1, 3]
    end

    def find_hand_type_part_two(cards)
      if cards.include? "J"
        return HandType::FIVE_OF_A_KIND if cards.uniq.size == 1

        type = find_hand_type(cards)
        new_type = {
          HandType::FOUR_OF_A_KIND => HandType::FIVE_OF_A_KIND,
          HandType::FULL_HOUSE => HandType::FIVE_OF_A_KIND,
          HandType::THREE_OF_A_KIND => HandType::FOUR_OF_A_KIND,
          HandType::TWO_PAIR => cards.count("J") == 2 ? HandType::FOUR_OF_A_KIND : HandType::FULL_HOUSE,
          HandType::ONE_PAIR => HandType::THREE_OF_A_KIND,
          HandType::HIGH_CARD => HandType::ONE_PAIR,
        }[type]

        return new_type
      end

      find_hand_type(cards)
    end

    def compare(first_hand, second_hand, cards_strength)
      return 1 if first_hand.first > second_hand.first

      return -1 if first_hand.first < second_hand.first

      first_hand[1].chars.each_with_index do |letter, index|
        next if letter == second_hand[1][index]

        return 1 if cards_strength.find_index(letter) < cards_strength.find_index(second_hand[1][index])

        return -1
      end
    end
  end
end
