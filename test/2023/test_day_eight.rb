# frozen_string_literal: true

require_relative "../../src/2023/day_eight"
require "minitest/autorun"

class TestDayEight2023 < Minitest::Test
  def setup
    @lines = File.read("inputs/2023/day_eight.in")
  end

  def test_part_one
    result = DayEight2023.part_one(@lines)

    assert_equal 16_343, result
  end

  def test_part_two
    result = DayEight2023.part_two(@lines)

    assert_equal 15_299_095_336_639, result
  end
end
