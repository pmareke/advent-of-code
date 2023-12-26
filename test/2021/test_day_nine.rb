# frozen_string_literal: true

require_relative "../../src/2021/day_nine"
require "minitest/autorun"
require "minitest/pride"

class TestDayNine2021 < Minitest::Test
  def setup
    lines = File.open("inputs/2021/day_nine.in")
    @input = lines.readlines.map(&:strip)
  end

  def test_part_one
    result = DayNine2021.part_one(@input)

    assert_equal 539, result
  end

  def test_part_two
    result = DayNine2021.part_two(@input)

    assert_equal 736_920, result
  end
end
