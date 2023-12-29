# frozen_string_literal: true

class IntCode
  attr_reader :numbers, :output, :halted

  def initialize(numbers, input = 0)
    @numbers = Hash.new(0)
    numbers.each_with_index do |value, index|
      @numbers[index] = value
    end
    @inputs = [input]
    @output = []
    @pointer = 0
    @relative = 0
    @halted = false
  end

  def run
    execute until @halted
    @output
  end

  def run_without_halt
    @output = []
    loop do
      execute
      return @output if !@output.empty? || @halted
    end
  end

  def execute
    operation, modes = parse_operation
    case operation
    when 1
      add_opcode(modes)
    when 2
      multiply_opcode(modes)
    when 3
      input_opcode(modes[0])
    when 4
      output_opcode(modes[0])
    when 5
      jump_if_true(modes)
    when 6
      jump_if_false(modes)
    when 7
      less_than(modes)
    when 8
      equals(modes)
    when 9
      modify_relative_offset(modes[0])
    when 99
      @halted = true
    end
  end

  def input(number)
    @inputs << number
  end

  def parse_operation
    operation = @numbers[@pointer]
    str = operation.to_s.rjust(5, "0").chars
    opcode = str.last(2).join.to_i
    [opcode, str[0..-3].map(&:to_i).reverse]
  end

  def add_opcode(modes)
    result = get_params(modes).reduce(:+)
    write_value(@numbers[@pointer + 3], modes[2], result)
    @pointer += 4
  end

  def multiply_opcode(modes)
    result = get_params(modes).reduce(:*)
    write_value(@numbers[@pointer + 3], modes[2], result)
    @pointer += 4
  end

  def input_opcode(mode)
    write_value(@numbers[@pointer + 1], mode, @inputs.shift)
    @pointer += 2
  end

  def output_opcode(mode)
    param = get_param(@pointer + 1, mode)
    @pointer += 2
    @output.append(param)
  end

  def jump_if_true(modes)
    first, second = get_params(modes)
    if first.zero?
      @pointer += 3
    else
      @pointer = second
    end
  end

  def jump_if_false(modes)
    first, second = get_params(modes)
    if first.zero?
      @pointer = second
    else
      @pointer += 3
    end
  end

  def modify_relative_offset(mode)
    @relative += get_param(@pointer + 1, mode)
    @pointer += 2
  end

  def less_than(modes)
    first, second = get_params(modes)
    result = first < second ? 1 : 0
    write_value(@numbers[@pointer + 3], modes[2], result)
    @pointer += 4
  end

  def equals(modes)
    first, second = get_params(modes)
    result = first == second ? 1 : 0
    write_value(@numbers[@pointer + 3], modes[2], result)
    @pointer += 4
  end

  def get_params(modes)
    [get_param(@pointer + 1, modes[0]), get_param(@pointer + 2, modes[1])]
  end

  def get_param(pointer, mode)
    if mode.zero?
      @numbers[@numbers[pointer]]
    elsif mode == 1
      @numbers[pointer]
    elsif mode == 2
      @numbers[@relative + @numbers[pointer]]
    else
      raise "unknown mode"
    end
  end

  def write_value(pointer, mode, value)
    if mode.zero?
      @numbers[pointer] = value
    elsif mode == 2
      @numbers[pointer + @relative] = value
    else
      raise "invalid write mode"
    end
  end
end
