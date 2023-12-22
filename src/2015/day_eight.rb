# frozen_string_literal: true

class DayEight2015
  def self.part_one(lines)
    lines.sum do |line|
      code_chars = line.size
      code_chars - eval(line).size
    end
  end

  def self.part_two(lines)
    lines.sum do |line|
      code_chars = line.size
      line.dump.size - code_chars
    end
  end
end
