# frozen_string_literal: true

require_relative "../../src/2017/day_three"
require "minitest/autorun"

class TestDayThree2017 < Minitest::Test
  def setup
    @input = File.open("inputs/2017/day_three.in").readlines.first.to_i
  end

  def test_part_one
    result = DayThree2017.part_one(@input)

    assert_equal 430, result
  end

  def test_part_two
    result = DayThree2017.part_two(@input)

    assert_equal 312_453, result
  end
end
