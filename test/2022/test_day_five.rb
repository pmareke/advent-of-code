# frozen_string_literal: true

require_relative "../../src/2022/day_five"

class TestDayFive2022 < Minitest::Test
  def setup
    @lines = File.open("inputs/2022/day_five.in").readlines
  end

  def test_part_one
    result = DayFive2022.part_one(@lines)

    assert_equal "JRVNHHCSJ", result
  end

  def test_part_two
    result = DayFive2022.part_two(@lines)

    assert_equal "GNFBSBJLH", result
  end
end
