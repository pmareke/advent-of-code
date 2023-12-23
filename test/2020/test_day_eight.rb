# frozen_string_literal: true

require_relative "../../src/2020/day_eight"

class TestDayEight2020 < Minitest::Test
  def setup
    @lines = File.open("inputs/2020/day_eight.in").readlines.map(&:strip)
  end

  def test_part_one
    result = DayEight2020.part_one(@lines)

    assert_equal 1949, result
  end

  def test_part_two
    result = DayEight2020.part_two(@lines)

    assert_equal 2092, result
  end
end
