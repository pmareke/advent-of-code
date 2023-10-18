# frozen_string_literal: true

class DayFour2020
  def self.part_one(lines)
    lines.inject(0) do |acc, line|
      fields = line.scan(/byr|iyr|eyr|hgt|hcl|ecl|pid/)
      acc += 1 if fields.size == 7
      acc
    end
  end

  def self.part_two(lines)
    lines.inject(0) do |acc, line|
      acc += 1 if valid?(line)
      acc
    end
  end

  class << self
    def valid?(line)
      line = line.tr("\n", " ").strip

      byr = line.scan(/byr:(\w+)/).flatten.first.to_i
      return false if byr < 1920 || byr > 2002

      iyr = line.scan(/iyr:(\w+)/).flatten.first.to_i
      return false if iyr < 2010 || iyr > 2020

      eyr = line.scan(/eyr:(\w+)/).flatten.first.to_i
      return false if eyr < 2020 || eyr > 2030

      hgt = line.scan(/hgt:(\w+)cm|in/)
      return false if hgt.empty?

      hgt = line.scan(/hgt:(\w+)/).flatten.first
      qty = hgt[0..-2].to_i
      return false if hgt.end_with?("cm") && (qty < 150 || qty > 193)
      return false if hgt.end_with?("in") && (qty < 59 || qty > 76)

      hcl = line.scan(/hcl:#(\w{6})/)
      return false if hcl.empty?

      ecl = line.scan(/ecl:(amb|blu|brn|gry|grn|hzl|oth)/)
      return false if ecl.empty?

      pid = line.scan(/pid:(\w+)/)
      return false if pid.empty?

      pid.flatten.first.size == 9
    end
  end
end
