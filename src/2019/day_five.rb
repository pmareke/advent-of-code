# frozen_string_literal: true

require_relative "models/int_code"

class DayFive2019
  def self.part_one(numbers)
    IntCode.run(numbers, 1)
  end

  def self.part_two(numbers)
    IntCode.run(numbers, 5)
  end
end
