# frozen_string_literal: true

require "digest/md5"

class DayFour2015
  def self.part_one(secret)
    calculate(secret, zeros: 5)
  end

  def self.part_two(secret)
    calculate(secret, zeros: 6)
  end

  class << self
    def calculate(secret, zeros:)
      times = 0
      md5 = ""
      total_zeros = "0" * zeros
      until md5.start_with? total_zeros
        md5 = Digest::MD5.hexdigest "#{secret}#{times}"
        times += 1
      end
      times.pred
    end
  end
end
