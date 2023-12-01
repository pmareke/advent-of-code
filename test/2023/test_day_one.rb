# frozen_string_literal: true

require_relative "../../src/2023/day_one"
require "minitest/autorun"

class TestDayOne2023 < Minitest::Test
  def setup
    lines = File.open("inputs/2023/day_one.in")
    @input = lines.readlines
  end

  def test_part_one
    result = DayOne2023.part_one(@input)

    assert_equal 54_632, result
  end

  def test_part_two
    result = DayOne2023.part_two(@input)

    assert_equal 54_019, result
  end
end
