require "digest/md5"

class DayFour2015
  def self.part_one(secret)
    self.calculate(secret, zeros: 5)
  end

  def self.part_two(secret)
    self.calculate(secret, zeros: 6)
  end

  private

  def self.calculate(secret, zeros:)
    times = 0
    md5 = ""
    total_zeros = "0" * zeros
    until md5.start_with? total_zeros
      md5 = Digest::MD5.hexdigest "#{secret}#{times}"
      times += 1
    end
    return times.pred
  end
end
