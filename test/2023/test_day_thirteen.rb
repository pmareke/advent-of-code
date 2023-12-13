# frozen_string_literal: true

require_relative "../../src/2023/day_thirteen"
require "minitest/autorun"

class TestDayThirteen2023 < Minitest::Test
  def setup
    file = "inputs/2023/day_thirteen.in"
    @lines = File.read(file)
  end

  def test_part_one
    result = DayThirteen2023.part_one(@lines)

    assert_equal 27_505, result
  end

  def test_part_two
    result = DayThirteen2023.part_two(@lines)

    assert_equal 22_906, result
  end
end
