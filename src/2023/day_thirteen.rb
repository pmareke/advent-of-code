# frozen_string_literal: true

class DayThirteen2023
  def self.part_one(lines)
    lines.split("\n\n").sum do |line|
      grid = line.split("\n").map(&:chars)
      calculate_vertical(grid.transpose) + (calculate_vertical(grid) * 100)
    end
  end

  def self.part_two(lines)
    lines.split("\n\n").sum do |line|
      grid = line.split("\n").map(&:chars)
      calculate_vertical(grid.transpose, required_smudges: 1) + (calculate_vertical(grid, required_smudges: 1) * 100)
    end
  end

  class << self
    def calculate_vertical(grid, required_smudges: 0)
      size = grid.size - 1
      reflexion_line = -1
      size.times do |middle|
        up = middle
        down = up + 1
        mirror = true
        smudges = 0
        while up >= 0 && down <= size
          smudges += count_smudges(grid[up], grid[down])
          if smudges > required_smudges
            mirror = false
            break
          end
          up -= 1
          down += 1
        end

        next unless mirror && smudges == required_smudges

        reflexion_line = middle
      end
      reflexion_line.next
    end

    def count_smudges(row1, row2)
      row1.zip(row2).count { |e1, e2| e1 != e2 }
    end
  end
end
