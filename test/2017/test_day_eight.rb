# frozen_string_literal: true

require_relative "../../src/2017/day_eight"

class TestDayEight2017 < Minitest::Test
  def setup
    lines = File.open("inputs/2017/day_eight.in")
    @input = lines.readlines.map(&:strip).map(&:split)
  end

  def test_part_one
    result = DayEight2017.part_one(@input)

    assert_equal 4448, result
  end

  def test_part_two
    result = DayEight2017.part_two(@input)

    assert_equal 6582, result
  end
end
