class DayOne2021
  def self.part_one(numbers)
    self.calculate(numbers)
  end

  def self.part_two(numbers)
    self.calculate(numbers, limit: 4)
  end

  private

  def self.calculate(numbers, limit: 2)
    numbers
      .each_cons(limit)
      .to_a
      .count { |element| element[0] < element[limit - 1] }
  end
end
