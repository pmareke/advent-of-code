# frozen_string_literal: true

class DaySix2021
  def self.part_one(line)
    state = initial_state(line)
    80.times do |_|
      state = play(state)
    end
    state.values.reduce(&:+)
  end

  def self.part_two(line)
    state = initial_state(line)
    256.times do |_|
      state = play(state)
    end
    state.values.reduce(&:+)
  end

  class << self
    def initial_state(line)
      state = { 0 => 0, 1 => 0, 2 => 0, 3 => 0, 4 => 0, 5 => 0, 6 => 0, 7 => 0, 8 => 0 }
      line.scan(/\d/).each_with_object(state) do |digit, acc|
        acc[digit.to_i] += 1
        acc
      end
    end

    def play(state)
      {
        0 => state[1],
        1 => state[2],
        2 => state[3],
        3 => state[4],
        4 => state[5],
        5 => state[6],
        6 => state[0] + state[7],
        7 => state[8],
        8 => state[0],
      }
    end
  end
end
