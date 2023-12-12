# frozen_string_literal: true

require_relative "../../src/2023/day_twelve"
require "minitest/autorun"

class TestDayTwelve2023 < Minitest::Test
  def setup
    file = "inputs/2023/day_twelve.in"
    @lines = File.readlines(file).map(&:strip)
  end

  def test_part_one
    result = DayTwelve2023.part_one(@lines)

    assert_equal 7857, result
  end

  def test_part_two
    result = DayTwelve2023.part_two(@lines)

    assert_equal 28_606_137_449_920, result
  end
end
