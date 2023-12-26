# frozen_string_literal: true

class DayNine2017
  def self.part_one(line)
    processed = process_input(line)
    garbage_free = processed.join.gsub(/<.*?>/, "")
    result = garbage_free.chars.each_with_object({ current_val: 0, total: 0 }) do |char, acc|
      case char
      when "{"
        acc[:current_val] += 1
        acc[:total] += acc[:current_val]
      when "}"
        acc[:current_val] -= 1
      end
    end
    result[:total]
  end

  def self.part_two(line)
    processed = process_input(line)
    garbages = processed.join.to_enum(:scan, /(<.*?>)/).map { Regexp.last_match }
    garbages.map { |g| g[1].size - 2 }.sum
  end

  class << self
    def process_input(line)
      index = 0
      line.chars.size.times.each_with_object([]) do |_, acc|
        if line[index] == "!"
          index += 2
          next
        end
        acc << line[index]
        index += 1
      end
    end
  end
end
