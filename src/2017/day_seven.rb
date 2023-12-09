# frozen_string_literal: true

require_relative "models/tower"

class DaySeven2017
  def self.part_one(lines)
    towers = create_towers(lines)
    towers.values.filter { |tower| tower.parent.nil? }.first.name
  end

  def self.part_two(lines)
    towers = create_towers(lines)
    valid = towers.each_value.reject(&:valid?)
    min, max = valid.first.towers.map(&:weight).minmax
    valid.first.towers.max.size - (max - min)
  end

  class << self
    def create_towers(lines)
      lines.each_with_object({}) do |line, acc|
        parts = line.scan(/(?:\w+)/)
        tower = acc[parts.first] || Tower.new(parts.first)
        tower.size = parts[1].to_i
        if parts.size > 2
          parts[2..].each do |name|
            new_tower = acc[name] || Tower.new(name)
            new_tower.parent = tower.name
            acc[new_tower.name] = new_tower
            tower.towers << new_tower
          end
        end
        acc[tower.name] = tower
      end
    end
  end
end
