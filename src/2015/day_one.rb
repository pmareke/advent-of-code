class DayOne2015
  def self.part_one(parenthesis)
    parenthesis.inject(1) do |acc, letter|
      acc += letter == "(" ? 1 : -1
    end
  end

  def self.part_two(parenthesis)
    position = 0
    parenthesis.inject(1) do |acc, letter|
      acc += letter == "(" ? 1 : -1
      return position if acc == -1

      position += 1
      acc
    end
  end
end
