# frozen_string_literal: true

require_relative "../../src/2021/day_five"

class TestDayFive21 < Minitest::Test
  def setup
    @coordinates = File.open("inputs/2021/day_five.in").readlines
  end

  def test_part_one
    result = DayFive2021.part_one(@coordinates)

    assert_equal 6841, result
  end

  def test_part_two
    result = DayFive2021.part_two(@coordinates)

    assert_equal 19_258, result
  end
end
