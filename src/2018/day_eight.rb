# frozen_string_literal: true

class DayEight2018
  def self.part_one(line)
    sequence = line.split.map(&:to_i)
    collect_metadata(sequence).sum
  end

  def self.part_two(line)
    sequence = line.split.map(&:to_i)
    calculate_score(sequence)
  end

  class << self
    def collect_metadata(sequence)
      child, metadata = sequence.shift(2)

      child.times.map { collect_metadata(sequence) }.flatten + sequence.shift(metadata)
    end

    def calculate_score(sequence)
      child, metadata = sequence.shift(2)

      return sequence.shift(metadata).sum if child.zero?

      children_scores = child.times.each_with_object({}) do |number, scores|
        scores[number.next] = calculate_score(sequence)
      end
      sequence.shift(metadata).map { |n| children_scores[n] }.compact.sum
    end
  end
end
