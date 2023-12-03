# frozen_string_literal: true

require "set"

class DayThree2023
  def self.part_one(lines)
    engine = generate_engine(lines)
    engine.each_with_index.reduce(0) do |acc, (row, idx)|
      row.each_with_index do |item, idy|
        next if item.scan(/(?:\d|\.)/).first

        neighbords = find_neighbors(engine, idx, idy)
        acc += neighbords.sum
      end
      acc
    end
  end

  def self.part_two(lines)
    engine = generate_engine(lines)
    engine.each_with_index.reduce(0) do |acc, (row, idx)|
      row.each_with_index do |item, idy|
        next if item.scan(/(?:\d|\.)/).first

        neighbords = find_neighbors(engine, idx, idy)
        acc += neighbords.reduce(&:*) if neighbords.size == 2
      end
      acc
    end
  end

  class << self
    def generate_engine(lines)
      lines.each_with_object([]) do |line, matrix|
        numbers = line.scan(/(?:\d+|.)/)
        matrix << numbers.each_with_object([]) do |number, row|
          # In order to have the same number of elements per row
          # We need to insert the number as many times as its length, ex:
          # "." -> ["."]
          # "12" -> ["12", "12"]
          # "634" -> ["634", "634", "634"]
          # Later when we'll check the neighbords we will exclude the duplications
          repetead_number = [number] * number.length
          row.push(*repetead_number)
        end
      end
    end

    def find_neighbors(engine, idx, idy)
      positions = [0, 1, -1].freeze
      neighbords = positions.each_with_object([]) do |x, acc|
        positions.each do |y|
          number = engine[idx + x][idy + y]
          next unless number =~ /\d/

          acc << number
        end
      end
      Set.new(neighbords.map(&:to_i))
    end
  end
end
