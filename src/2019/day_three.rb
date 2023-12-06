# frozen_string_literal: true

class DayThree2019
  def self.part_one(wires)
    wire = walk_part_one wires.first
    another_wire = walk_part_one wires[1]

    wire.intersection(another_wire).map do |pair|
      pair.split(":").map(&:to_i).map(&:abs).sum
    end.min
  end

  def self.part_two(wires)
    wire = walk_part_two wires.first
    another_wire = walk_part_two wires[1]

    intersection = wire.keys & another_wire.keys
    intersection.map { |point| wire[point] + another_wire[point] }.min
  end

  class << self
    def walk_part_one(wire)
      seen = Set.new
      x = y = 0
      wire.strip.split(",").each do |instruction|
        direction = instruction[0]
        steps = instruction[1..].to_i
        steps.times do |_|
          case direction
          when "L"
            y -= 1
          when "R"
            y += 1
          when "U"
            x -= 1
          else
            x += 1
          end
          seen.add("#{x}:#{y}")
        end
      end
      seen
    end

    def walk_part_two(wire)
      seen = {}
      x = y = 0
      step = 1
      wire.strip.split(",").each do |instruction|
        direction = instruction[0]
        steps = instruction[1..].to_i
        steps.times do |_|
          case direction
          when "L"
            y -= 1
          when "R"
            y += 1
          when "U"
            x -= 1
          else
            x += 1
          end

          point = "#{x}:#{y}"
          seen[point] = step unless seen[point]
          step += 1
        end
      end
      seen
    end
  end
end
