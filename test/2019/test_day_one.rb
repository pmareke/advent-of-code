# frozen_string_literal: true

require_relative "../../src/2019/day_one"

class TestDayOne2019 < Minitest::Test
  def setup
    @numbers = File.open("inputs/2019/day_one.in").map(&:to_i)
  end

  def test_part_one
    result = DayOne2019.part_one(@numbers)

    assert_equal 3_353_880, result
  end

  def test_part_two
    result = DayOne2019.part_two(@numbers)

    assert_equal 5_027_950, result
  end
end
