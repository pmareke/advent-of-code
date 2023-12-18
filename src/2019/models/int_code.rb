# frozen_string_literal: true

class IntCode
  attr_reader :numbers, :output, :halted

  def initialize(numbers, input = 0)
    @numbers = numbers
    @inputs = [input]
    @output = 0
    @pointer = 0
    @halted = false
  end

  def run
    loop do
      operation, modes = parse_operation
      case operation
      when 1
        p1, p2, out = operation_with_three_parameters(modes)
        @numbers[out] = p1 + p2
        @pointer += 4
      when 2
        p1, p2, out = operation_with_three_parameters(modes)
        @numbers[out] = p1 * p2
        @pointer += 4
      when 3
        output = @numbers[@pointer + 1]
        @numbers[output] = @inputs.shift
        @pointer += 2
      when 4
        current = @numbers[@pointer + 1]
        @output = @numbers[current]
        @pointer += 2
      when 5
        p1, p2 = operation_with_two_parameters(modes)
        @pointer = p1.zero? ? @pointer + 3 : p2
      when 6
        p1, p2 = operation_with_two_parameters(modes)
        @pointer = p1.zero? ? p2 : @pointer + 3
      when 7
        p1, p2, out = operation_with_three_parameters(modes)
        @numbers[out] = p1 < p2 ? 1 : 0
        @pointer += 4
      when 8
        p1, p2, out = operation_with_three_parameters(modes)
        @numbers[out] = p1 == p2 ? 1 : 0
        @pointer += 4
      when 99
        @halted = true
        return @output
      end
    end
  end

  def input(number)
    @inputs << number
  end

  def parse_operation
    operation = @numbers[@pointer]
    str = operation.to_s.rjust(5, "0").chars
    opcode = str.last(2).join.to_i
    modes = str[0..-3].map(&:to_i).map(&:zero?).reverse
    [opcode, modes]
  end

  def operation_with_three_parameters(modes)
    x = @numbers[@pointer + 1]
    p1 = modes[0] ? @numbers[x] : x
    y = @numbers[@pointer + 2]
    p2 = modes[1] ? @numbers[y] : y
    out = @numbers[@pointer + 3]
    [p1, p2, out]
  end

  def operation_with_two_parameters(modes)
    x = @numbers[@pointer + 1]
    p1 = modes[0] ? @numbers[x] : x
    y = @numbers[@pointer + 2]
    p2 = modes[1] ? @numbers[y] : y
    [p1, p2]
  end
end
