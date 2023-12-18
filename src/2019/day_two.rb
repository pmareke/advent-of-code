# frozen_string_literal: true

require_relative "models/int_code"

class DayTwo2019
  def self.part_one(numbers)
    noun = 12
    verb = 2
    numbers = [numbers.first, noun, verb, *numbers[3..]]
    program = IntCode.new(numbers)
    program.run
    program.numbers.first
  end

  def self.part_two(numbers)
    99.times do |noun|
      99.times do |verb|
        nums = [numbers.first, noun, verb, *numbers[3..]]
        program = IntCode.new(nums)
        program.run
        result = program.numbers.first
        return (100 * noun) + verb if result == 19_690_720
      end
    end
  end
end
