# frozen_string_literal: true

require_relative "../../src/2023/day_three"
require "minitest/autorun"

class TestDayThree2023 < Minitest::Test
  def setup
    lines = File.open("inputs/2023/day_three.in")
    @input = lines.readlines.map(&:strip)
  end

  def test_part_one
    result = DayThree2023.part_one(@input)

    assert_equal 0, result
  end

  def test_part_two
    result = DayThree2023.part_two(@input)

    assert_equal 0, result
  end
end
