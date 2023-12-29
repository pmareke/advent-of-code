# frozen_string_literal: true

require_relative "models/int_code"

class DayNine2019
  def self.part_one(numbers)
    program = IntCode.new(numbers, 1)
    program.run.first
  end

  def self.part_two(numbers)
    program = IntCode.new(numbers, 2)
    program.run.first
  end
end
