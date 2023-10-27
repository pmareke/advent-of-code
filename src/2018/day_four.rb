# frozen_string_literal: true

class DayFour2018
  def self.part_one(lines)
    entries = parse_lines(lines).sort
    sleepiest_guard, sleeps = sleep_intervals(entries).max_by do |_, intervals|
      intervals.sum(&:count)
    end
    worst_minute = (0..60).max_by do |minute|
      sleeps.count { |interval| interval.cover?(minute) }
    end
    sleepiest_guard * worst_minute
  end

  def self.part_two(lines)
    entries = parse_lines(lines).sort
    guards_worst_minutes = sleep_intervals(entries).map do |guard, intervals|
      worst_count = intervals.count { |interval| interval.cover?(0) }
      worst_minute = 0
      (1..60).each do |minute|
        count = intervals.count { |interval| interval.cover?(minute) }
        if count > worst_count
          worst_count = count
          worst_minute = minute
        end
      end
      { guard:, worst_minute:, times_asleep: worst_count }
    end

    worst_guard = guards_worst_minutes.max_by { |guard| guard[:times_asleep] }
    worst_guard[:guard] * worst_guard[:worst_minute]
  end

  class << self
    def parse_lines(lines)
      lines.map do |line|
        line.strip.scan(/\[(\d+)-(\d\d)-(\d\d) (\d\d):(\d\d)\] (.+)/).flatten
      end
    end

    def sleep_intervals(parsed_lines)
      current_guard = nil
      feel_asleep = 0
      guard_intervals = Hash.new { |h, k| h[k] = [] }
      parsed_lines.each_with_object(guard_intervals) do |(_year, _month, _day, _hour, minute, message), acc|
        minute = minute.to_i
        if message.include?("#")
          current_guard = message.gsub(/\D/, "").to_i
        elsif message.end_with?("asleep")
          feel_asleep = minute
        else
          guard_intervals[current_guard] << (feel_asleep..(minute - 1))
        end
        acc
      end
    end
  end
end
