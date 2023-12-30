# frozen_string_literal: true

class DayTen2017
  def self.part_one(numbers)
    knots = twist(numbers.split(",").map(&:to_i), 1)
    knots.take(2).reduce(:*)
  end

  def self.part_two(numbers)
    bytes = numbers.bytes + [17, 31, 73, 47, 23]
    knots = twist(bytes, 64)
    chars = knots.each_slice(16).map { |byte| byte.reduce(0, :^).to_s(16).rjust(2, "0") }
    chars.join
  end

  class << self
    def twist(lengths, number)
      pos = 0
      skip = 0
      number.times.with_object((0..255).to_a) do |_, acc|
        lengths.each do |len|
          acc.rotate!(pos)
          acc[0, len] = acc[0, len].reverse
          acc.rotate!(-pos)
          pos += len + skip
          skip += 1
        end
      end
    end
  end
end
