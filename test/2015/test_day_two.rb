# frozen_string_literal: true

require_relative "../../src/2015/day_two"

class TestDayTwo2015 < Minitest::Test
  def setup
    @dimensions = File.open("inputs/2015/day_two.in").readlines
  end

  def test_part_one
    result = DayTwo2015.part_one(@dimensions)

    assert_equal 1_606_483, result
  end

  def test_part_two
    result = DayTwo2015.part_two(@dimensions)

    assert_equal 3_842_356, result
  end
end
