# frozen_string_literal: true

require_relative "../../src/2023/day_eleven"
require "minitest/autorun"

class TestDayEleven2023 < Minitest::Test
  def setup
    file = "inputs/2023/day_eleven.in"
    @lines = File.readlines(file).map(&:strip)
  end

  def test_part_one
    result = DayEleven2023.part_one(@lines)

    assert_equal 9_693_756, result
  end

  def test_part_two
    result = DayEleven2023.part_two(@lines)

    assert_equal 717_878_258_016, result
  end
end
