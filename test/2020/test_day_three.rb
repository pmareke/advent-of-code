# frozen_string_literal: true

require_relative "../../src/2020/day_three"
require "minitest/autorun"

class TestDayThree2020 < Minitest::Test
  def setup
    @lines = File.open("inputs/2020/day_three.in").readlines.map(&:strip)
  end

  def test_part_one
    result = DayThree2020.part_one(@lines)

    assert_equal 203, result
  end

  def test_part_two
    result = DayThree2020.part_two(@lines)

    assert_equal 3_316_272_960, result
  end
end
