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
          number.length.times { |_| row << number }
        end
      end
    end

    def find_neighbors(engine, idx, idy)
      positions = [0, 1, 0, -1].freeze
      neighbords = positions.each_with_object([]) do |x, acc|
        positions.each do |y|
          acc << engine[idx + x][idy + y].to_i
        end
      end
      Set.new(neighbords).reject(&:zero?)
    end
  end
end
