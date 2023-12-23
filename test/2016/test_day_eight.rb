# frozen_string_literal: true

require_relative "../../src/2016/day_eight"
require "minitest/pride"
require "minitest/autorun"

class TestDayEight2016 < Minitest::Test
  def setup
    @lines = File.open("inputs/2016/day_eight.in").readlines.map(&:strip)
  end

  def test_part_one
    result = DayEight2016.part_one(@lines)

    assert_equal 106, result
  end

  def test_part_two
    result = DayEight2016.part_two(@lines)

    assert_equal "CFLELOYFCS", result
  end
end
