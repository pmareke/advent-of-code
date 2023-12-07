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
    cards_strength = %w[A K Q J T 9 8 7 6 5 4 3 2]
    solve(lines, cards_strength)
  end

  def self.part_two(lines)
    cards_strength = %w[A K Q T 9 8 7 6 5 4 3 2 J]
    solve(lines, cards_strength, part_two: true)
  end

  class << self
    def solve(lines, cards_strength, part_two: false)
      hands = lines.reduce([]) do |acc, line|
        cards, bid = line.split
        type = part_two ? find_hand_type_part_two(cards.chars) : find_hand_type(cards.chars)
        acc << [type, cards, bid.to_i]
      end

      sorted_hands = hands.sort { |h1, h2| compare(h1, h2, cards_strength) }
      sorted_hands.each_with_index.reduce([]) { |acc, (hand, index)| acc << (hand[2] * index.next) }.reduce(&:+)
    end

    def find_hand_type(cards)
      group_by_letter = cards.tally
      repetitions = group_by_letter.values.sort
      {
        [5] => HandType::FIVE_OF_A_KIND,
        [1, 4] => HandType::FOUR_OF_A_KIND,
        [2, 3] => HandType::FULL_HOUSE,
        [1, 1, 3] => HandType::THREE_OF_A_KIND,
        [1, 2, 2] => HandType::TWO_PAIR,
        [1, 1, 1, 2] => HandType::ONE_PAIR,
        [1, 1, 1, 1, 1] => HandType::HIGH_CARD,
      }[repetitions]
    end

    def find_hand_type_part_two(cards)
      return find_hand_type(cards) unless cards.include? "J"

      {
        HandType::FIVE_OF_A_KIND => HandType::FIVE_OF_A_KIND,
        HandType::FOUR_OF_A_KIND => HandType::FIVE_OF_A_KIND,
        HandType::FULL_HOUSE => HandType::FIVE_OF_A_KIND,
        HandType::THREE_OF_A_KIND => HandType::FOUR_OF_A_KIND,
        HandType::TWO_PAIR => cards.count("J") == 2 ? HandType::FOUR_OF_A_KIND : HandType::FULL_HOUSE,
        HandType::ONE_PAIR => HandType::THREE_OF_A_KIND,
        HandType::HIGH_CARD => HandType::ONE_PAIR,
      }[find_hand_type(cards)]
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
