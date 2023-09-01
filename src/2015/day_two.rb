class DayTwo2015
  def self.part_one(dimensions)
    dimensions.sum do |dimension|
      sides = dimension.scan(/\d+/).map(&:to_i)
      surface(sides) + smallest_area(sides)
    end
  end

  def self.part_two(dimensions)
    dimensions.sum do |dimension|
      sides = dimension.scan(/\d+/).map(&:to_i)
      bow(sides) + smallest_sides(sides)
    end
  end

  private

  def self.surface(sides)
    l, w, h = sides
    2 * l * w + 2 * w * h + 2 * h * l
  end

  def self.smallest_area(sides)
    sides.sort.first(2).inject(&:*)
  end

  def self.bow(sides)
    sides.inject(&:*)
  end

  def self.smallest_sides(sides)
    sides.sort.first(2).sum * 2
  end
end
