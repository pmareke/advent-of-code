# frozen_string_literal: true

require_relative "models/linked_list"

class DayNine2018
  def self.part_one(line)
    players, last_marble = line.scan(/(?:(\d+))/).flatten.map(&:to_i)
    highest_score(players, last_marble)
  end

  def self.part_two(line)
    players, last_marble = line.scan(/(?:(\d+))/).flatten.map(&:to_i)
    highest_score(players, last_marble * 100)
  end

  class << self
    def highest_score(players, last_marble)
      scores = Hash.new(0)
      last_marble_number = 0
      current_marble = LinkedListNode.new(0)

      while last_marble_number < last_marble
        last_marble_number += 1
        new_marble = last_marble_number

        if (new_marble % 23).zero?
          # The marble 7 marbles counter-clockwise from the current marble is
          # removed from the circle and also added to the current player's score.
          marble_to_remove = current_marble.prev.prev.prev.prev.prev.prev.prev
          current_player = last_marble_number % players
          scores[current_player] += new_marble + marble_to_remove.value
          current_marble = marble_to_remove.delete
        else
          current_marble = current_marble.next.insert_after(new_marble)
        end
      end

      scores.values.max
    end
  end
end
