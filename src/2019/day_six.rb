# frozen_string_literal: true

require "set"

class DaySix2019
  def self.part_one(lines)
    map = create_map(lines)
    map.keys.sum { |current| walk(map, current).count - 1 }
  end

  def self.part_two(lines)
    map = create_map(lines)
    you = Set.new walk(map, "YOU")
    san = Set.new walk(map, "SAN")
    intersection = (you & san).first
    you.find_index(intersection) + san.find_index(intersection) - 2
  end

  class << self
    def create_map(lines)
      lines.each_with_object({}) do |line, acc|
        x, y = line.scan(/(?:\w+)/)
        acc[y] = x
      end
    end

    def walk(map, node, visited = [])
      return visited if node.nil?

      walk(map, map[node], [*visited, node])
    end
  end
end
