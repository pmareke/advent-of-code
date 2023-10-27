# frozen_string_literal: true

class DayFive2018
  def self.part_one(line)
    trim(line.chars).size - 1
  end

  def self.part_two(line)
    original_trimmed_chars = trim(line.chars)
    most_problematic_type = ("a".."z").min_by do |char|
      chars = original_trimmed_chars.clone
      delete_type(char, chars)
      trim(chars).count
    end
    chars = original_trimmed_chars.clone
    delete_type(most_problematic_type, chars)
    trim(chars).count - 1
  end

  class << self
    def delete_type(type, chars)
      chars.delete(type)
      chars.delete(type.upcase)
    end

    def trim(chars)
      idx = 0
      loop do
        break if idx == chars.size - 1

        if chars[idx].swapcase == chars[idx.next]
          2.times { chars.delete_at(idx) }
          idx -= 1
        else
          idx += 1
        end
      end
      chars
    end
  end
end
