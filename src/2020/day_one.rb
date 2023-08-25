class DayOne2020
  def self.part_one(numbers)
    self.calculate(numbers)
  end

  def self.part_two(numbers)
    self.calculate(numbers, limit: 3)
  end

  private

  def self.calculate(numbers, limit: 2)
    numbers
      .permutation(limit)
      .filter { |element| element.sum == 2020 }
      .map { |element| element.inject(1, :*) }
      .first
  end
end
