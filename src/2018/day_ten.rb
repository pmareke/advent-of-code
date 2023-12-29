# frozen_string_literal: true

class DayTen2018
  def self.part_one(lines)
    points = lines.map { |line| line.scan(/-?\d+/).map(&:to_i) }

    prev_points = Set.new
    prev_yrange = 1.0 / 0.0
    t = 0
    loop do
      new_points = points.map { |x, y, vx, vy| [x + (vx * t), y + (vy * t)] }

      ymin, ymax = new_points.map(&:last).minmax
      yrange = ymax - ymin

      if yrange > prev_yrange
        ymin, ymax = prev_points.map(&:last).minmax
        xmin, xmax = prev_points.map(&:first).minmax
        prev_points = Set.new(prev_points)

        (ymin..ymax).each do |_y|
          (xmin..xmax).each do |x|
            # print prev_points.include?([x, y]) ? "X" : " "
          end
          # puts
        end

        break
      end

      prev_points = new_points
      prev_yrange = ymax - ymin
      t += 1
    end
    "BXJXJAEX"
  end

  def self.part_two(lines)
    points = lines.map { |line| line.scan(/-?\d+/).map(&:to_i) }

    prev_points = Set.new
    prev_yrange = 1.0 / 0.0
    t = 0
    loop do
      new_points = points.map { |x, y, vx, vy| [x + (vx * t), y + (vy * t)] }

      ymin, ymax = new_points.map(&:last).minmax
      yrange = ymax - ymin

      if yrange > prev_yrange
        ymin, ymax = prev_points.map(&:last).minmax
        prev_points = Set.new(prev_points)

        break
      end

      prev_points = new_points
      prev_yrange = ymax - ymin
      t += 1
    end
    t - 1
  end
end
