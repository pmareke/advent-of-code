class DayOne2022
  def self.part_one(groups)
    self.calculate(groups)
  end

  def self.part_two(groups)
    self.calculate(groups, 3)
  end

  private

  def self.calculate(groups, limit = 1)
    groups
      .map { |group| calculate_sum_for(group) }
      .sort
      .last(limit)
      .sum
  end

  def self.calculate_sum_for(group)
    group
      .split("
")
      .map(&:to_i)
      .sum
  end
end
