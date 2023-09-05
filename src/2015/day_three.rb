require "set"

class DayThree2015
  def self.part_one(instructions)
    x = y = 0
    seen = Set[[x, y]]
    instructions.each do |instruction|
      x, y = self.update_position(instruction, x, y)
      pair = [x, y]
      seen.add(pair)
    end
    seen.count
  end

  def self.part_two(instructions)
    x = x1 = y = y1 = 0
    seen = Set[[x, y]]
    instructions.each_slice(2) do |instruction, neighbour|
      x, y = self.update_position(instruction, x, y)
      pair = [x, y]
      seen.add(pair)
      x1, y1 = self.update_position(neighbour, x1, y1)
      pair = [x1, y1]
      seen.add(pair)
    end
    seen.count
  end

  private

  def self.update_position(instruction, x, y)
    case instruction
    when "^"
      [x + 1, y]
    when "v"
      [x - 1, y]
    when ">"
      [x, y + 1]
    else
      [x, y - 1]
    end
  end
end
