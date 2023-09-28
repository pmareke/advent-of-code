# frozen_string_literal: true

require_relative "../../src/2022/day_two"

class TestDayTwo2022 < Minitest::Test
  def setup
    @pairs = File.open("inputs/2022/day_two.in").readlines.map(&:strip).map(&:split)
  end

  def test_part_one
    result = DayTwo2022.part_one(@pairs)

    assert_equal 13_005, result
  end

  def test_part_two
    result = DayTwo2022.part_two(@pairs)

    assert_equal 11_373, result
  end
end
