# frozen_string_literal: true

require_relative "../../src/2022/day_ten"
require "minitest/pride"
require "minitest/autorun"

class TestDayTen2022 < Minitest::Test
  def setup
    @lines = File.open("inputs/2022/day_ten.in").readlines.map(&:strip)
  end

  def test_part_one
    result = DayTen2022.part_one(@lines)

    assert_equal 13_220, result
  end

  def test_part_two
    result = DayTen2022.part_two(@lines)

    assert_equal "RUAKHBEK", result
  end
end
