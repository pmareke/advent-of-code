# frozen_string_literal: true

require_relative "models/rope_node"

class DayNine2022
  def self.part_one(lines)
    solve(lines, rope_length: 2)
  end

  def self.part_two(lines)
    solve(lines, rope_length: 10)
  end

  class << self
    def solve(lines, rope_length:)
      seen = Set.new
      rope = create_rope(rope_length)

      directions = { "U" => [-1, 0], "D" => [1, 0], "L" => [0, -1], "R" => [0, 1] }
      lines.each_with_object(seen) do |line, _acc|
        direction, steps = line.split
        steps.to_i.times do |_idx|
          rope[0].value = rope[0].value.zip(directions[direction]).map(&:sum)
          rope.each do |knot|
            if knot.next.nil?
              seen << knot.value
            else
              head = knot.value
              tail = knot.next.value

              knot.next.value = move_tail(head, tail) unless touching?(head, tail)
            end
          end
        end
      end
      seen.size
    end

    def create_rope(rope_length)
      rope = Array.new(rope_length) { RopeNode.new([0, 0]) }
      next_node = nil
      rope.reverse.each do |knot|
        knot.next = next_node
        next_node = knot
      end
      rope
    end

    def touching?(head, tail)
      (head.first - tail.first).abs <= 1 && (head.last - tail.last).abs <= 1
    end

    def move_tail(head, tail)
      deltas = head.zip(tail).map { |a, b| a - b }
      x = 0
      y = 0
      if deltas.first.abs >= 2
        x = deltas.first / deltas.first.abs
        y = deltas.last / deltas.last.abs if deltas.last.abs.positive?
      else
        y = deltas.last / deltas.last.abs
        x = deltas.first / deltas.first.abs if deltas.first.abs.positive?
      end
      tail.zip([x, y]).map(&:sum)
    end
  end
end
