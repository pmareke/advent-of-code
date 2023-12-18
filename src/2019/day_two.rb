# frozen_string_literal: true

require_relative "models/int_code"

class DayTwo2019
  def self.part_one(numbers)
    noun = 12
    verb = 2
    program = [numbers.first, noun, verb, *numbers[3..]]
    IntCode.run(program)
  end

  def self.part_two(numbers)
    99.times do |noun|
      99.times do |verb|
        program = [numbers.first, noun, verb, *numbers[3..]]
        result = IntCode.run(program)
        return (100 * noun) + verb if result == 19_690_720
      end
    end
  end
end
