# frozen_string_literal: true

class DayTen2021
  def self.part_one(lines)
    total = 0
    lines.each do |line|
      pairs = { "{" => "}", "(" => ")", "[" => "]", "<" => ">" }
      points = { "}" => 1197, ")" => 3, "]" => 57, ">" => 25_137 }
      queue = []
      line.chars.each do |char|
        if queue.empty? || pairs.key?(char)
          queue << char
          next
        end

        close = queue.pop
        next unless pairs[close] != char

        total += points[char]
        break
      end
    end
    total
  end

  def self.part_two(lines)
    pairs = { "{" => "}", "(" => ")", "[" => "]", "<" => ">" }
    points = { "{" => 3, "(" => 1, "[" => 2, "<" => 4 }
    scores = lines.each_with_object([]) do |line, acc|
      queue = []
      valid = true
      line.chars.each do |char|
        if queue.empty? || pairs.key?(char)
          queue << char
          next
        end

        close = queue.pop
        if pairs[close] != char
          valid = false
          break
        end
      end
      acc << queue.reverse.reduce(0) { |score, char| (score * 5) + points[char] } if valid
    end

    scores.sort[scores.size / 2]
  end
end
