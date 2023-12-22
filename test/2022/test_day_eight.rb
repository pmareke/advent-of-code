# frozen_string_literal: true

require_relative "../../src/2022/day_eight"

class TestDayEight2022 < Minitest::Test
  def setup
    @lines = File.open("inputs/2022/day_eight.in").readlines.map(&:strip).map(&:chars)
  end

  def test_part_one
    result = DayEight2022.part_one(@lines)

    assert_equal 1851, result
  end

  def test_part_two
    result = DayEight2022.part_two(@lines)

    assert_equal 574_080, result
  end
end
