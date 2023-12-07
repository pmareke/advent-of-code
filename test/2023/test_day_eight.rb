# frozen_string_literal: true

require_relative "../../src/2023/day_eight"
require "minitest/autorun"

class TestDayEight2023 < Minitest::Test
  def setup
    lines = File.open("inputs/2023/day_eight.in")
    @input = lines.readlines.map(&:strip)
  end

  def test_part_one
    result = DayEight2023.part_one(@input)

    assert_equal 0, result
  end

  def test_part_two
    result = DayEight2023.part_two(@input)

    assert_equal 0, result
  end
end
