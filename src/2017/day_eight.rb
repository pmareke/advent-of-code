# frozen_string_literal: true

class DayEight2017
  def self.part_one(lines)
    registers, = calculate(lines)
    registers.values.max
  end

  def self.part_two(lines)
    _, max = calculate(lines)
    max
  end

  class << self
    def calculate(lines)
      registers = Hash.new(0)
      max = 0
      lines.each do |line|
        target, op, delta, _if, source, cmp_op, cmp_val = line
        next unless registers[source].send(cmp_op, cmp_val.to_i)

        operation = op == "dec" ? -1 : 1
        registers[target] += delta.to_i * operation
        max = [max, registers[target]].max
      end
      [registers, max]
    end
  end
end
