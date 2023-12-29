# frozen_string_literal: true

require_relative "../../src/2019/day_ten"
require "minitest/pride"
require "minitest/autorun"

class TestDayTen2019 < Minitest::Test
  def setup
    lines = File.open("inputs/2019/day_ten.in")
    @input = lines.readlines.map(&:strip)
  end

  def test_part_one
    result = DayTen2019.part_one(@input)

    assert_equal 319, result
  end

  def test_part_two
    result = DayTen2019.part_two(@input)

    assert_equal 517, result
  end
end
