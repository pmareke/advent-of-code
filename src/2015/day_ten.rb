# frozen_string_literal: true

class DayTen2015
  def self.part_one(sequence)
    40.times do
      sequence = look_and_say(sequence)
    end
    sequence.size
  end

  def self.part_two(sequence)
    50.times do
      sequence = look_and_say(sequence)
    end
    sequence.size
  end

  class << self
    def look_and_say(sequence)
      output = []
      times = 0
      sequence.chars.each_cons(2) do |x, y|
        times += 1
        if x != y
          output << "#{times}#{x}"
          times = 0
        end
      end
      output << "1#{sequence.chars.last}" if sequence.size.even?
      output.join
    end
  end
end
