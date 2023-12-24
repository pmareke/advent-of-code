# frozen_string_literal: true

require_relative "../../src/2018/day_eight"

class TestDayEight2018 < Minitest::Test
  def setup
    @input = File.open("inputs/2018/day_eight.in").readlines.first.strip
  end

  def test_part_one
    result = DayEight2018.part_one(@input)

    assert_equal 42_951, result
  end

  def test_part_two
    result = DayEight2018.part_two(@input)

    assert_equal 18_568, result
  end
end
