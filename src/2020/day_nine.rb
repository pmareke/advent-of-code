# frozen_string_literal: true

class DayNine2020
  def self.part_one(lines)
    lines.each_cons(26) do |numbers|
      previous = numbers[0...-1]
      target = numbers.last

      not_valid = previous.permutation(2).map(&:sum).include?(target)
      return target unless not_valid
    end
  end

  def self.part_two(lines)
    target = part_one(lines)
    (2..lines.size).each do |idx|
      lines.each_cons(idx) do |numbers|
        return numbers.minmax.sum if numbers.sum == target
      end
    end
  end
end
