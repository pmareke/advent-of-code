# frozen_string_literal: true

class DaySix2015
  def self.part_one(instructions)
    matrix = create_matrix
    instructions.each_with_object(matrix) do |instruction, acc|
      from, to = instruction.scan(/(\d+).(\d+)/)
      x1, y1 = from.map(&:to_i)
      x2, y2 = to.map(&:to_i)
      (x1..x2).each do |x|
        (y1..y2).each do |y|
          acc[x][y] = 1 if instruction.include? "on"
          acc[x][y] = 0 if instruction.include? "off"
          acc[x][y] = acc[x][y].zero? ? 1 : 0 if instruction.include?("toggle")
        end
      end
      acc
    end

    matrix.flatten.count { |item| item == 1 }
  end

  def self.part_two(instructions)
    matrix = create_matrix
    instructions.each_with_object(matrix) do |instruction, acc|
      from, to = instruction.scan(/(\d+).(\d+)/)
      x1, y1 = from.map(&:to_i)
      x2, y2 = to.map(&:to_i)
      (x1..x2).each do |x|
        (y1..y2).each do |y|
          acc[x][y] += 1 if instruction.include? "on"
          acc[x][y] -= 1 if acc[x][y].positive? && instruction.include?("off")
          acc[x][y] += 2 if instruction.include? "toggle"
        end
      end
      acc
    end.flatten.sum
  end

  class << self
    def create_matrix
      acc = []
      1000.times do |idx|
        acc.push []
        1000.times do |idy|
          acc[idx][idy] = 0
        end
      end
      acc
    end
  end
end
