# frozen_string_literal: true

class DayFour2016
  def self.part_one(lines)
    lines.sum { |line| real? line }
  end

  def self.part_two(lines)
    lines.each do |line|
      id, message = decrypt(line)
      return id if message.include? "north"
    end
  end

  class << self
    def real?(line)
      letters, id, checksum = line.scan(/^(.*)-(.*)\[(.*)\]$/).flatten
      common = letters.tr("-", "").chars.tally.sort_by { |k, v| [-v, k] }.map(&:first).join
      common.start_with?(checksum) ? id.to_i : 0
    end

    def decrypt(line)
      letters, id = line.scan(/^(.*)-(.*)\[(.*)\]$/).flatten
      [id.to_i, find_message(letters, id)]
    end

    def find_message(letters, id)
      alphabet = Array("a".."z")
      encrypter = alphabet.zip(alphabet.rotate(id.to_i)).to_h
      letters.chars.map { |c| encrypter.fetch(c, " ") }.join
    end
  end
end
