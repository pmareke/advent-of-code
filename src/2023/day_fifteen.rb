# frozen_string_literal: true

class DayFifteen2023
  def self.part_one(lines)
    lines.sum { |line| line.split(",").sum { |step| calculate_hash(step) } }
  end

  def self.part_two(lines)
    boxes = lines.first.split(",").each_with_object({}) do |step, acc|
      if step.include? "-"
        label = step.split("-").first
        box = calculate_hash(label)
        next unless acc[box]

        to_remove = acc[box].find { |len| len.include? label }
        next unless to_remove

        acc[box].delete(to_remove)
        next
      end

      label, focus = step.split("=")
      box = calculate_hash(label)
      acc[box] = [] if acc[box].nil?
      to_override = acc[box].find { |len| len.include? label }
      unless to_override
        acc[box] << "#{label} #{focus}"
        next
      end
      index = acc[box].find_index(to_override)
      acc[box][index] = "#{label} #{focus}"
    end

    boxes.sum do |box_id, lens|
      lens.each_with_index.sum do |len, index|
        ((box_id + 1) * (index + 1)) * len.split.last.to_i
      end
    end
  end

  class << self
    def calculate_hash(label)
      label.chars.reduce(0) do |acc, digit|
        acc = ((acc + digit.ord) * 17).remainder(256)
        acc
      end
    end
  end
end
