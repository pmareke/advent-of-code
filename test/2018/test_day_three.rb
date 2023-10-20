# frozen_string_literal: true

require_relative "../../src/2018/day_three"

class TestDayThree2018 < Minitest::Test
  def setup
    @lines = File.open("inputs/2018/day_three.in").readlines.map(&:strip)
  end

  def test_part_one
    result = DayThree2018.part_one(@lines)

    assert_equal 111_326, result
  end

  def test_part_two
    result = DayThree2018.part_two(@lines)

    assert_equal 1019, result
  end
end
