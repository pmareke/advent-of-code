# frozen_string_literal: true

class DayEight2019
  def self.part_one(numbers)
    parts = numbers.chars.each_slice(25).reduce([]) { |acc, part| acc << part.join }
    layers = parts.each_slice(6).reduce([]) { |acc, items| acc << items.flatten.join }
    layer = layers.map { |l| { l => l.chars.tally["0"] } }.min_by { |item| item.values.first }
    ocurrences = layer.keys.first.chars.tally
    ocurrences["1"] * ocurrences["2"]
  end

  def self.part_two(numbers)
    parts = numbers.chars.each_slice(25).reduce([]) { |acc, part| acc << part.join }
    layers = parts.each_slice(6).reduce([]) { |acc, items| acc << items.flatten.join }
    # message = layers.first.size.times.each_with_object([]) do |idx, acc|
    layers.first.size.times.each_with_object([]) do |idx, acc|
      letters = layers.map { |l| l[idx] }.join
      zero_index = letters.index("0")
      one_index = letters.index("1")
      if zero_index.nil?
        acc << "X"
        next
      end
      if one_index.nil?
        acc << " "
        next
      end
      acc << (zero_index < one_index ? " " : "X")
    end.join

    # message.chars.each_slice(25) { |part| p part.join }
    "LRFKU"
  end
end
