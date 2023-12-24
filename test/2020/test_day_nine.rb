# frozen_string_literal: true

require_relative "../../src/2020/day_nine"

class TestDayNine2020 < Minitest::Test
  def setup
    @lines = File.open("inputs/2020/day_nine.in").readlines.map(&:strip).map(&:to_i)
  end

  def test_part_one
    result = DayNine2020.part_one(@lines)

    assert_equal 104_054_607, result
  end

  def test_part_two
    result = DayNine2020.part_two(@lines)

    assert_equal 13_935_797, result
  end
end
