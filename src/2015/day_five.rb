class DayFive2015
  def self.part_one(lines)
    lines.count(&:nice_part_one?)
  end

  def self.part_two(lines)
    lines.count(&:nice_part_two?)
  end
end

class String
  def nice_part_one?
    /^(?=.*[aeiou].*[aeiou].*[aeiou])(?=.*(\w)\1)(?!.*(?:ab|cd|pq|xy)).*$/.match self
  end

  def nice_part_two?
    /^(?=.*([a-zA-Z]{2}).*\1)(?=.*(\w)\w\2).*$/.match self
  end
end
