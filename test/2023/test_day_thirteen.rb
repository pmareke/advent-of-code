# frozen_string_literal: true

require_relative "../../src/2023/day_thirteen"
require "minitest/autorun"

class TestDayThirteen2023 < Minitest::Test
  def setup
    file = "inputs/2023/day_thirteen.in"
    @lines = File.readlines(file).map(&:strip)
  end

  def test_part_one
    result = DayThirteen2023.part_one(@lines)

    assert_equal 0, result
  end

  def test_part_two
    result = DayThirteen2023.part_two(@lines)

    assert_equal 0, result
  end
end
