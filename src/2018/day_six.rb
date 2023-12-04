# frozen_string_literal: true

class DaySix2018
  def self.part_one(lines)
    points = lines.reduce([]) do |acc, line|
      acc << line.scan(/(?:\d+)/).map(&:to_i)
    end
    max = points.max_by(&:max).max

    counts = Hash.new(0)
    infinites = Hash.new(0)
    values = (0..max).to_a
    values.product(values).each do |value|
      distances = points.map.with_index do |point, idx|
        [idx, (point[0] - value.first).abs + (point[1] - value[1]).abs]
      end.to_h

      distance = distances.values.min
      closest = distances.select { |_, v| v == distance }.keys
      idx = closest.first
      counts[idx] += 1 if closest.count == 1
      infinites[idx] = -1 if value.first.zero? || value[1].zero? || value.first == max || value[1] == max
    end

    counts.merge(infinites).values.max
  end

  def self.part_two(lines)
    points = lines.reduce([]) do |acc, line|
      acc << line.scan(/(?:\d+)/).map(&:to_i)
    end
    max = points.max_by(&:max).max

    values = (0..max).to_a
    values.product(values).reduce(0) do |acc, value|
      distance = points.reduce(0) do |total, point|
        total + (point.first - value.first).abs + (point[1] - value[1]).abs
      end
      acc += 1 if distance < 10_000
      acc
    end
  end
end
