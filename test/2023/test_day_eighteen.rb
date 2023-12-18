# frozen_string_literal: true

require_relative "../../src/2023/day_eighteen"

class TestDayEighteen2023 < Minitest::Test
  def setup
    @lines = File.open("inputs/2023/day_eighteen.in").readlines.map(&:strip)
  end

  def test_part_one
    result = DayEighteen2023.part_one(@lines)

    assert_equal 50_465, result
  end

  def test_part_two
    result = DayEighteen2023.part_two(@lines)

    assert_equal 82_712_746_433_310, result
  end
end
