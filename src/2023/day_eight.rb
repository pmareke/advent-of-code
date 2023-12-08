# frozen_string_literal: true

class DayEight2023
  def self.part_one(lines)
    instructions, *relations = lines.split("\n\n")
    nodes = create_nodes(relations)
    next_point = "AAA"
    steps = 0
    instructions.chars.cycle do |instruction|
      steps += 1
      index = instruction == "L" ? 0 : 1
      next_point = nodes[next_point][index]

      return steps if next_point == "ZZZ"
    end
  end

  def self.part_two(lines)
    instructions, *relations = lines.split("\n\n")
    nodes = create_nodes(relations)
    next_points = nodes.keys.filter { |key| key.end_with? "A" }
    total_steps = next_points.each_with_object([]) do |next_point, acc|
      steps = 0
      instructions.chars.cycle do |instruction|
        steps += 1
        index = instruction == "L" ? 0 : 1
        next_point = nodes[next_point][index]

        if next_point.end_with? "Z"
          acc << steps
          break # We need to get out of the cycle!
        end
      end
    end
    total_steps.reduce(1, :lcm)
  end

  class << self
    def create_nodes(relations)
      relations.first.split("\n").each_with_object({}) do |relation, acc|
        point, left, right = relation.scan(/(?:\w+)/)
        acc[point] = [left, right]
      end
    end
  end
end
