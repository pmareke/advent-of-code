# frozen_string_literal: true

require_relative "../../src/2022/day_nine"

class TestDayNine2022 < Minitest::Test
  def setup
    @lines = File.open("inputs/2022/day_nine.in").readlines
  end

  def test_part_one
    result = DayNine2022.part_one(@lines)

    assert_equal 6087, result
  end

  def test_part_two
    result = DayNine2022.part_two(@lines)

    assert_equal 2493, result
  end
end
