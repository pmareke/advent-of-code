# frozen_string_literal: true

class DayEight2020
  @acc = 0
  def self.part_one(lines)
    @acc = 0
    seen = Set.new
    pointer = 0
    loop do
      line = lines[pointer]
      return @acc if seen.include?(pointer)

      seen << pointer
      op, offset = line.split
      pointer +=1
      pointer += offset.to_i - 1 if op == "jmp"
      @acc += offset.to_i if op == "acc"
    end
  end

  def self.part_two(lines)
    nops = lines.each_with_index.filter { |line, _idx| line.start_with?("nop") }.map(&:last)
    jmps = lines.each_with_index.filter { |line, _idx| line.start_with?("jmp") }.map(&:last)

    nops.each do |idx|
      new_lines = lines.clone
      new_lines[idx] = new_lines[idx].gsub("nop", "jmp")
      begin
        part_one(new_lines)
      rescue NoMethodError
        return @acc
      end
    end

    jmps.each do |idx|
      new_lines = lines.clone
      new_lines[idx] = new_lines[idx].gsub("jmp", "nop")
      begin
        part_one(new_lines)
      rescue NoMethodError
        return @acc
      end
    end
  end
end
