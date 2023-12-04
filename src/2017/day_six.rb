# frozen_string_literal: true

require "set"

class DaySix2017
  def self.part_one(line)
    blocks = line.scan(/(?:\d+)/).map(&:to_i)
    initial_state = blocks.freeze
    configurations = Set.new([initial_state])
    loop do
      blocks = cycle(blocks)

      return configurations.size if configurations.include? blocks

      configurations.add(blocks)
    end
  end

  def self.part_two(line)
    blocks = line.scan(/(?:\d+)/).map(&:to_i)
    configurations = Set.new([blocks])
    loop do
      blocks = cycle(blocks)

      return configurations.size - configurations.find_index(blocks) if configurations.include? blocks

      configurations.add(blocks)
    end
  end

  class << self
    def cycle(blocks)
      most_blocks = blocks.max
      index = blocks.find_index(most_blocks)
      tmp = [*blocks[...index], 0, *blocks[index.next..]]
      most_blocks.times do |i|
        new_position = (index + i + 1) % tmp.size
        tmp[new_position] += 1
      end
      tmp
    end
  end
end
