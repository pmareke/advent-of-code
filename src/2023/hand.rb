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

class Hand
  attr_reader :cards, :bid, :type

  def initialize(cards, bid, part_two: false)
    @cards = cards
    @bid = bid.to_i
    @type = part_two ? find_hand_type_part_two : find_hand_type
    @cards_strength = part_two ? %w[A K Q T 9 8 7 6 5 4 3 2 J] : %w[A K Q J T 9 8 7 6 5 4 3 2]
  end

  def find_hand_type
    group_by_letter = @cards.tally
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

  def find_hand_type_part_two
    return find_hand_type unless @cards.include? "J"

    {
      HandType::FIVE_OF_A_KIND => HandType::FIVE_OF_A_KIND,
      HandType::FOUR_OF_A_KIND => HandType::FIVE_OF_A_KIND,
      HandType::FULL_HOUSE => HandType::FIVE_OF_A_KIND,
      HandType::THREE_OF_A_KIND => HandType::FOUR_OF_A_KIND,
      HandType::TWO_PAIR => @cards.count("J") == 2 ? HandType::FOUR_OF_A_KIND : HandType::FULL_HOUSE,
      HandType::ONE_PAIR => HandType::THREE_OF_A_KIND,
      HandType::HIGH_CARD => HandType::ONE_PAIR,
    }[find_hand_type]
  end

  def <=>(other)
    return 1 if @type > other.type

    return -1 if @type < other.type

    @cards.each_with_index do |letter, index|
      next if letter == other.cards[index]

      return 1 if @cards_strength.find_index(letter) < @cards_strength.find_index(other.cards[index])

      return -1
    end
  end
end
