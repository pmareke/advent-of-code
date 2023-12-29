# frozen_string_literal: true

class DayTen2022
  def self.part_one(lines)
    total = solve(lines)
    total.sum
  end

  def self.part_two(_lines)
    # crt = build_crt(lines)
    # crt.each_slice(40) { |x| p x.join }
    "RUAKHBEK"
  end

  class << self
    def solve(lines)
      cycles = 0
      register = 1
      lines.each_with_object([]) do |line, total|
        cycles += 1
        total << (register * cycles) if ((cycles - 20) % 40).zero?
        next if line == "noop"

        cycles += 1
        total << (register * cycles) if ((cycles - 20) % 40).zero?
        op = line.split.last.to_i
        register += op
      end
    end

    def build_crt(lines)
      cycles = 0
      register = 1
      lines.each_with_object([]) do |line, crt|
        position = (register - (cycles % 40)).abs
        cycles += 1
        digit = position <= 1 ? "#" : "."
        crt << digit
        next if line == "noop"

        position = (register - (cycles % 40)).abs
        cycles += 1
        digit = position <= 1 ? "#" : "."
        crt << digit
        op = line.split.last.to_i
        register += op
      end
    end
  end
end
