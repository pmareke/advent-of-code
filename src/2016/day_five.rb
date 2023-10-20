# frozen_string_literal: true

require "digest"

class DayFive2016
  def self.part_one(door_id)
    index = 0
    password = []
    loop do
      digest = Digest::MD5.hexdigest("#{door_id}#{index}")
      index += 1
      password << digest[5] if digest.start_with? "00000"
      return password.join if password.size == 8
    end
  end

  def self.part_two(door_id)
    index = 0
    password = []
    loop do
      digest = Digest::MD5.hexdigest("#{door_id}#{index}")
      index += 1
      next unless digest.start_with? "00000"

      position = digest[5]
      next unless valid_position?(position) && empty_slot?(password, position.to_i)

      value = digest[6]
      password[position.to_i] = value
      return password.join if password.compact.size == 8
    end
  end

  class << self
    def valid_position?(position)
      ("0".."7").include?(position)
    end

    def empty_slot?(password, position)
      password[position.to_i].nil?
    end
  end
end
