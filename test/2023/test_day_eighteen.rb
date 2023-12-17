# frozen_string_literal: true

require "minitest/pride"
require "minitest/autorun"
require_relative "../../src/2023/day_eighteen"

class TestDayEighteen2023 < Minitest::Test
  def setup
    @lines = File.read("inputs/2023/day_eighteen.in")
  end

  def test_part_one
    result = DayEighteen2023.part_one(@lines)

    assert_equal 0, result
  end

  def test_part_two
    result = DayEighteen2023.part_two(@lines)

    assert_equal 0, result
  end
end
