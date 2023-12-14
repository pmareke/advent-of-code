# frozen_string_literal: true

require_relative "../../src/2023/day_fourteen"

class TestDayFourteen2023 < Minitest::Test
  def setup
    file = "inputs/2023/day_fourteen.in"
    @lines = File.open(file).readlines.map(&:strip)
  end

  def test_part_one
    skip("Too Slow")
    result = DayFourteen2023.part_one(@lines)

    assert_equal 110_274, result
  end

  def test_part_two
    skip("Too Slow")
    result = DayFourteen2023.part_two(@lines)

    assert_equal 90_982, result
  end
end
