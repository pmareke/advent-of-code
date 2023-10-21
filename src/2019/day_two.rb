# frozen_string_literal: true

class DayTwo2019
  def self.part_one(numbers)
    noun = 12
    verb = 2
    program = [numbers.first, noun, verb, *numbers[3..]]
    run(program)
  end

  def self.part_two(numbers)
    99.times do |noun|
      99.times do |verb|
        program = [numbers.first, noun, verb, *numbers[3..]]
        result = run(program)
        return (100 * noun) + verb if result == 19_690_720
      end
    end
  end

  class << self
    def run(numbers)
      pointer = 0
      loop do
        operation = numbers[pointer]
        case operation
        when 1
          x = numbers[pointer + 1]
          y = numbers[pointer + 2]
          out = numbers[pointer + 3]
          numbers[out] = numbers[x] + numbers[y]
          pointer += 4
        when 2
          x = numbers[pointer + 1]
          y = numbers[pointer + 2]
          out = numbers[pointer + 3]
          numbers[out] = numbers[x] * numbers[y]
          pointer += 4
        when 99
          return numbers[0]
        end
      end
    end
  end
end