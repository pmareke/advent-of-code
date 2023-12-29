# frozen_string_literal: true

require_relative "../../src/2021/day_ten"
require "minitest/pride"
require "minitest/autorun"

class TestDayTen2021 < Minitest::Test
  def setup
    lines = File.open("inputs/2021/day_ten.in")
    @input = lines.readlines.map(&:strip)
  end

  def test_part_one
    result = DayTen2021.part_one(@input)

    assert_equal 392_043, result
  end

  def test_part_two
    result = DayTen2021.part_two(@input)

    assert_equal 1_605_968_119, result
  end
end
