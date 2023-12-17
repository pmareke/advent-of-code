# frozen_string_literal: true

require "rb_heap"

class DaySeventeen2023
  def self.part_one(lines)
    matrix = create_matrix(lines)
    minimal_heat(matrix, [0, 0], matrix.keys.max, 1, 3)
  end

  def self.part_two(lines)
    matrix = create_matrix(lines)
    minimal_heat(matrix, [0, 0], matrix.keys.max, 4, 10)
  end

  class << self
    def create_matrix(lines)
      lines.each_with_index.with_object({}) do |(line, idx), acc|
        line.chars.each_with_index do |digit, idy|
          key = [idx, idy]
          acc[key] = digit.to_i
        end
      end
    end

    def minimal_heat(matrix, start, finish, least, most)
      queue = Heap.new { |a, b| a.first < b.first }
      queue << [0, *start, 0, 0]
      seen = Set.new
      until queue.empty?
        current_heat, start_x, start_y, end_x, end_y = queue.pop
        return current_heat if finish == [start_x, start_y]

        next if seen.include?([start_x, start_y, end_x, end_y])

        seen.add([start_x, start_y, end_x, end_y])

        start_set = Set.new([[1, 0], [0, 1], [-1, 0], [0, -1]])
        existing_set = Set.new([[end_x, end_y], [-end_x, -end_y]])
        difference = start_set - existing_set
        difference.each do |dx, dy|
          new_x = start_x
          new_y = start_y
          new_heat = current_heat
          (1...most.next).each do |i|
            new_x += dx
            new_y += dy
            key = [new_x, new_y]
            next unless matrix.keys.include?(key)

            new_heat += matrix[key]
            queue << [new_heat, new_x, new_y, dx, dy] if i >= least
          end
        end
      end
    end
  end
end
