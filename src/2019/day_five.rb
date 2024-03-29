# frozen_string_literal: true

require_relative "models/int_code"

class DayFive2019
  def self.part_one(numbers)
    program = IntCode.new(numbers, 1)
    program.run.last
  end

  def self.part_two(numbers)
    program = IntCode.new(numbers, 5)
    program.run.first
  end
end
