# frozen_string_literal: true

class DaySeven2016
  def self.part_one(lines)
    lines.count do |line|
      normals, hypernets = parse(line)
      valid_tls?(normals, hypernets)
    end
  end

  def self.part_two(lines)
    lines.count do |line|
      normals, hypernets = parse(line)
      valid_ssl?(normals, hypernets)
    end
  end

  class << self
    def parse(line)
      aba_mode = true
      letters = []
      parts = line.chars.each_with_object([[], []]) do |letter, acc|
        if letter == "["
          aba_mode = false
          acc.first << letters.join unless letters.empty?
          letters = []
          next
        end
        if letter == "]"
          aba_mode = true
          acc[1] << letters.join unless letters.empty?
          letters = []
          next
        end
        letters << letter
      end
      parts.first << letters.join
      parts
    end

    def valid_tls?(normals, hypernets)
      normals.any? { |item| contains_abba(item) } && hypernets.none? { |item| contains_abba(item) }
    end

    def contains_abba(item)
      item.chars.each_cons(4).count do |parts|
        parts[0..1] == parts[2..3].reverse && parts.first != parts[1]
      end >= 1
    end

    def valid_ssl?(normals, hypernets)
      normals.any? do |normal|
        normal.chars.each_cons(3).count do |parts|
          bab = [parts[1], parts.first, parts[1]].join
          parts.first == parts.last && parts.first != parts[1] && hypernets.any? { |item| item.include? bab }
        end >= 1
      end
    end
  end
end
