# frozen_string_literal: true

class DayTwo2019
  def self.part_one(numbers)
    noun = 12
    verb = 2
    run(numbers, noun, verb)
  end

  def self.part_two(numbers)
    99.times do |noun|
      99.times do |verb|
        result = run(numbers.clone, noun, verb)
        return (100 * noun) + verb if result == 19_690_720
      end
    end
  end

  class << self
    def run(numbers, noun, verb)
      pointer = 0
      numbers[1] = noun
      numbers[2] = verb
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
