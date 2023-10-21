# frozen_string_literal: true

class DayFive2017
  def self.part_one(lines)
    numbers = lines.map(&:to_i)
    steps = index = 0
    loop do
      jump = numbers[index]

      return steps if jump.nil?

      numbers[index] += 1
      index += jump
      steps += 1
    end
  end

  def self.part_two(lines)
    numbers = lines.map(&:to_i)
    steps = index = 0
    loop do
      jump = numbers[index]

      return steps if jump.nil?

      numbers[index] += jump > 2 ? -1 : 1
      index += jump
      steps += 1
    end
  end
end
