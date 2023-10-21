# frozen_string_literal: true

require_relative "../../src/2019/day_two"

class TestDayTwo2019 < Minitest::Test
  def setup
    @numbers = File.open("inputs/2019/day_two.in").readlines.first.split(",").map(&:to_i)
  end

  def test_part_one
    result = DayTwo2019.part_one(@numbers)

    assert_equal 3_716_250, result
  end

  def test_part_two
    result = DayTwo2019.part_two(@numbers)

    assert_equal 6472, result
  end
end
