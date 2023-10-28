# frozen_string_literal: true

class DaySix2016
  def self.part_one(lines)
    matrix = lines.inject([]) do |acc, line|
      acc << line.strip.chars
    end.transpose

    matrix.map do |row|
      row.tally.sort { |x, y| y[1] <=> x[1] }.map(&:first)
    end.map(&:first).join
  end

  def self.part_two(lines)
    matrix = lines.inject([]) do |acc, line|
      acc << line.strip.chars
    end.transpose

    matrix.map do |row|
      row.tally.sort { |x, y| x[1] <=> y[1] }.map(&:first)
    end.map(&:first).join
  end
end
