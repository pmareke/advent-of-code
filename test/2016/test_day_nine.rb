# frozen_string_literal: true

require_relative "../../src/2016/day_nine"
require "minitest/autorun"
require "minitest/pride"

class TestDayNine2016 < Minitest::Test
  def setup
    lines = File.open("inputs/2016/day_nine.in")
    @input = lines.readlines.first.strip
  end

  def test_part_one
    result = DayNine2016.part_one(@input)

    assert_equal 123_908, result
  end

  def test_part_two
    result = DayNine2016.part_two(@input)

    assert_equal 10_755_693_147, result
  end
end
