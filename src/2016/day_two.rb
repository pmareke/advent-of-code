# frozen_string_literal: true

class DayTwo2016
  def self.part_one(lines)
    board = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
    generate_code(lines, board, 1, 1).to_i
  end

  def self.part_two(lines)
    board = [
      [nil, nil, 1, nil, nil],
      [nil, 2, 3, 4, nil],
      [5, 6, 7, 8, 9],
      [nil, "A", "B", "C", nil],
      [nil, nil, "D", nil, nil],
    ]

    generate_code(lines, board, 2, 0)
  end

  class << self
    def generate_code(lines, board, start_x, start_y)
      lines.inject([]) do |acc, line|
        line.strip.chars.each do |instruction|
          case instruction
          when "L"
            next if start_y.zero?

            start_y -= 1 unless board[start_x][start_y - 1].nil?
          when "R"
            start_y += 1 unless board[start_x][start_y + 1].nil?
          when "U"
            next if start_x.zero?

            start_x -= 1 unless board[start_x - 1][start_y].nil?
          else
            next if start_x == board.size - 1

            start_x += 1 unless board[start_x + 1][start_y].nil?
          end
        end
        acc << board[start_x][start_y]
      end.join
    end
  end
end
