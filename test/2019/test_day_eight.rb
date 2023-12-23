# frozen_string_literal: true

require_relative "../../src/2019/day_eight"
require "minitest/pride"
require "minitest/autorun"

class TestDayEight2019 < Minitest::Test
  def setup
    lines = File.open("inputs/2019/day_eight.in")
    @input = lines.readlines.map(&:strip).first
  end

  def test_part_one
    result = DayEight2019.part_one(@input)

    assert_equal 2460, result
  end

  def test_part_two
    result = DayEight2019.part_two(@input)

    assert_equal "LRFKU", result
  end
end
