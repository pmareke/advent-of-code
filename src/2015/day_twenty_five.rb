# frozen_string_literal: true

class DayTwentyFive2015
  def self.part_one(instruction)
    row, column = instruction.scan(/(?: (\d+))/).flatten.map(&:to_i)
    times = row + column - 2
    iterations = ((times * times.next) / 2) + column.pred
    iterations.times.reduce(20_151_125) do |acc, _|
      acc = (acc * 252_533) % 33_554_393
      acc
    end
  end
end
