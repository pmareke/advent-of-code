# frozen_string_literal: true

class DayFifteen2023
  def self.part_one(lines)
    lines.sum { |line| line.split(",").sum { |step| calculate_hash(step) } }
  end

  def self.part_two(lines)
    boxes = Hash.new { |hsh, key| hsh[key] = {} }
    lines.first.split(",").each_with_object(boxes) do |step, acc|
      label, sign, focus = step.split(/([=|-])/)
      box = calculate_hash(label)
      acc[box].delete(label) if sign == "-"
      acc[box][label] = focus.to_i if sign == "="
    end

    boxes.sum do |box_id, lens|
      lens.values.each_with_index.sum do |value, index|
        (box_id.next * index.next) * value
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
