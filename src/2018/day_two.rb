# frozen_string_literal: true

class DayTwo2018
  def self.part_one(sentences)
    two = three = 0
    sentences.count do |sentence|
      group = sentence.chars.tally
      two += 1 if group.values.include? 2
      three += 1 if group.values.include? 3
    end
    two * three
  end

  def self.part_two(sentences)
    word1, word2 = sentences.map(&:strip).permutation(2).find do |a, b|
      one_different_char? a, b
    end
    common_letters word1, word2
  end

  class << self
    def one_different_char?(word1, word2)
      word1.chars.zip(word2.chars).count { |a, b| a != b } == 1
    end

    def common_letters(word1, word2)
      word1.chars.zip(word2.chars).filter { |a, b| a == b }.map(&:first).join
    end
  end
end
