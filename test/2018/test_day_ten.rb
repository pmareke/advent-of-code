# frozen_string_literal: true

require_relative "../../src/2018/day_ten"
require "minitest/pride"
require "minitest/autorun"

class TestDayTen2018 < Minitest::Test
  def setup
    lines = File.open("inputs/2018/day_ten.in")
    @input = lines.readlines.map(&:strip)
  end

  def test_part_one
    result = DayTen2018.part_one(@input)

    assert_equal "BXJXJAEX", result
  end

  def test_part_two
    result = DayTen2018.part_two(@input)

    assert_equal 10_605, result
  end
end
