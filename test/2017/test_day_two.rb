# frozen_string_literal: true

require "minitest/autorun"
require_relative "../../src/2017/day_two"

class TestDayTwo2017 < Minitest::Test
  def setup
    @lines = File.open("inputs/2017/day_two.in").map { |line| line.split("\t") }
  end

  def test_part_one
    result = DayTwo2017.part_one(@lines)

    assert_equal 58_975, result
  end

  def test_part_two
    result = DayTwo2017.part_two(@lines)

    assert_equal 308, result
  end
end
