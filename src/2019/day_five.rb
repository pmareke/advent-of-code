# frozen_string_literal: true

class DayFive2019
  def self.part_one(numbers)
    run(numbers, 1)
  end

  def self.part_two(numbers)
    run(numbers, 5)
  end

  class << self
    def run(numbers, incode)
      output = 0
      pointer = 0
      loop do
        operation, modes = parse_operation(numbers[pointer])
        case operation
        when 1
          x = numbers[pointer + 1]
          p1 = modes[0] ? numbers[x] : x
          y = numbers[pointer + 2]
          p2 = modes[1] ? numbers[y] : y
          out = numbers[pointer + 3]
          numbers[out] = p1 + p2
          pointer += 4
        when 2
          x = numbers[pointer + 1]
          p1 = modes[0] ? numbers[x] : x
          y = numbers[pointer + 2]
          p2 = modes[1] ? numbers[y] : y
          out = numbers[pointer + 3]
          numbers[out] = p1 * p2
          pointer += 4
        when 3
          output = numbers[pointer + 1]
          numbers[output] = incode
          pointer += 2
        when 4
          current = numbers[pointer + 1]
          output = numbers[current]
          pointer += 2
        when 5
          x = numbers[pointer + 1]
          p1 = modes[0] ? numbers[x] : x
          y = numbers[pointer + 2]
          p2 = modes[1] ? numbers[y] : y
          pointer = p1.zero? ? pointer + 3 : p2
        when 6
          x = numbers[pointer + 1]
          p1 = modes[0] ? numbers[x] : x
          y = numbers[pointer + 2]
          p2 = modes[1] ? numbers[y] : y
          pointer = p1.zero? ? p2 : pointer + 3
        when 7
          x = numbers[pointer + 1]
          p1 = modes[0] ? numbers[x] : x
          y = numbers[pointer + 2]
          p2 = modes[1] ? numbers[y] : y
          z = numbers[pointer + 3]
          numbers[z] = p1 < p2 ? 1 : 0
          pointer += 4
        when 8
          x = numbers[pointer + 1]
          p1 = modes[0] ? numbers[x] : x
          y = numbers[pointer + 2]
          p2 = modes[1] ? numbers[y] : y
          z = numbers[pointer + 3]
          numbers[z] = p1 == p2 ? 1 : 0
          pointer += 4
        when 99
          return output
        end
      end
    end

    def parse_operation(operation)
      str = operation.to_s.rjust(5, "0").chars
      opcode = str.last(2).join.to_i
      modes = str[0..-3].map(&:to_i).map(&:zero?).reverse
      [opcode, modes]
    end
  end
end
