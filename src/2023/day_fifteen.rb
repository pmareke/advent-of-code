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

        box_to_override = acc[box].find { |len| len.include? label }
        next unless box_to_override

        acc[box].delete(box_to_override)
        next
      end

      label, focus = step.split("=")
      box = calculate_hash(label)
      acc[box] = [] if acc[box].nil?
      box_to_override = acc[box].find { |len| len.include? label }
      if box_to_override
        index = acc[box].find_index(box_to_override)
        acc[box][index] = "#{label} #{focus}"
        next
      end
      acc[box] << "#{label} #{focus}"
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
