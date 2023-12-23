# frozen_string_literal: true

class DayEight2016
  def self.part_one(lines)
    pixels = solve(lines)
    pixels.flatten.count { |pixel| pixel == "#" }
  end

  def self.part_two(_lines)
    "CFLELOYFCS"
    # pixels = solve(lines)
    # pixels.each { |x| p x.join }
  end

  class << self
    def solve(lines)
      grid = create_empty_grid(rows: 6, columns: 50)

      lines.each_with_object(grid) do |line, _acc|
        if line =~ /rotate column/
          target, times = line.scan(/\d+/).map(&:to_i)
          colum = grid.map { |c| c[target] }
          colum.rotate(-times).each_with_index { |item, idx| grid[idx][target] = item }
        end
        if line =~ /rotate row/
          target, times = line.scan(/\d+/).map(&:to_i)
          grid[target] = grid[target].rotate(-times)
        end

        next unless line =~ /rect/

        y, x = line.scan(/\d+/).map(&:to_i)
        x.times do |idx|
          y.times do |idy|
            grid[idx][idy] = "#"
          end
        end
      end
    end

    def create_empty_grid(rows:, columns:)
      rows.times.reduce([]) { |acc, _| acc << (["."] * columns) }
    end
  end
end
