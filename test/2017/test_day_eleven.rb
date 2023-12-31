# frozen_string_literal: true

require_relative "../../src/2017/day_eleven"
require "minitest/pride"
require "minitest/autorun"

class TestDayEleven2017 < Minitest::Test
  def setup
    lines = File.open("inputs/2017/day_eleven.in")
    @input = lines.readlines.map(&:strip).first
  end

  def test_part_one
    result = DayEleven2017.part_one(@input)

    assert_equal 743, result
  end

  def test_part_two
    result = DayEleven2017.part_two(@input)

    assert_equal 1493, result
  end
end
