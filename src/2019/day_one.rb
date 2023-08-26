class DayOne2019
  def self.part_one(numbers)
    self.calculate_fuel(numbers)
  end

  def self.part_two(numbers)
    self.calculate_fuel_recursive(numbers)
  end

  private

  def self.calculate_fuel(numbers)
    numbers
      .map { |element| element / 3 - 2 }
      .sum
  end

  def self.calculate_fuel_recursive(numbers)
    numbers
      .map { |element| self.calculate_all_fuel(element) }
      .sum
  end

  def self.calculate_all_fuel(element)
    total = 0
    while true
      element = element / 3 - 2
      if element.positive?
        total += element
      else
        break
      end
    end
    total
  end
end
