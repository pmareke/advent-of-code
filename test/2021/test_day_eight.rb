# frozen_string_literal: true

require_relative "../../src/2021/day_eight"

class TestDayEight2021 < Minitest::Test
  def setup
    lines = File.open("inputs/2021/day_eight.in")
    @input = lines.readlines.map(&:strip)
  end

  def test_part_one
    result = DayEight2021.part_one(@input)

    assert_equal 525, result
  end

  def test_part_two
    result = DayEight2021.part_two(@input)

    assert_equal 1_083_859, result
  end
end
