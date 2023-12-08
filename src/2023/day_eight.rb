# frozen_string_literal: true

class DayEight2023
  def self.part_one(lines)
    instructions, *relations = lines.split("\n\n")
    nodes = create_nodes(relations)
    next_point = "AAA"
    steps = 0
    instructions.chars.cycle do |instruction|
      steps += 1
      next_point = nodes[next_point][instruction]

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
        next_point = nodes[next_point][instruction]

        if next_point.end_with? "Z"
          acc << steps
          break # We need to get out of the cycle, but keep in the next_points loop!
        end
      end
    end

    # Trying to find the number of steps in which all the nodes at the same time end in "Z"
    # would take ages, instead we need to find how many steps will take each node started in "A" separately
    # and then calculate the [Less Common Multiplea](https://en.wikipedia.org/wiki/Least_common_multiple)
    total_steps.reduce(1, :lcm)
  end

  class << self
    def create_nodes(relations)
      relations.first.split("\n").each_with_object({}) do |relation, acc|
        point, left, right = relation.scan(/(?:\w+)/)
        acc[point] = { "L" => left, "R" => right }
      end
    end
  end
end
