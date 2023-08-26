class DayOne2017
  def self.part_one(numbers)
    self.calculate_catch(numbers, step = 1)
  end

  def self.part_two(numbers)
    step = numbers.size / 2
    self.calculate_catch(numbers, step)
  end

  private

  def self.calculate_catch(numbers, step)
    digits = []
    numbers.each_with_index do |number, index|
      next_index = (index + step) % numbers.size
      if number == numbers[next_index]
        digits.push(number)
      end
    end
    digits.sum
  end
end
