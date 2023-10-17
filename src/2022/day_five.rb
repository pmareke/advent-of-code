# frozen_string_literal: true

class DayFive2022
  def self.part_one(lines)
    buckets = head
    lines.each do |line|
      times, from, to = parse_line line
      move = buckets[from - 1].pop(times).reverse
      buckets[to - 1].push(*move)
    end
    buckets.map(&:last).join
  end

  def self.part_two(lines)
    buckets = head
    lines.each do |line|
      times, from, to = parse_line line
      move = buckets[from - 1].pop(times)
      buckets[to - 1].push(*move)
    end
    buckets.map(&:last).join
  end

  class << self
    def head
      [
        %w[W D G B H R V],
        %w[J N G C R F],
        %w[L S F H D N J],
        %w[J D S V],
        %w[S H D R Q W N V],
        %w[P G H C M],
        %w[F J B G L Z H C],
        %w[S J R],
        %w[L G S R B N V M],
      ]
    end

    def parse_line(line)
      regex = /move (\d+) from (\d+) to (\d+)/
      line.scan(regex).flatten.map(&:to_i)
    end
  end
end
