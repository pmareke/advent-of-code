# frozen_string_literal: true

require_relative "../../src/2022/day_three"

class TestDayThree2022 < Minitest::Test
  def setup
    @lines = File.open("inputs/2022/day_three.in").map(&:strip)
  end

  def test_part_one
    result = DayThree2022.part_one(@lines)

    assert_equal 8085, result
  end

  def test_part_two
    result = DayThree2022.part_two(@lines)

    assert_equal 2515, result
  end
end
