# frozen_string_literal: true

require_relative "../../src/2020/day_ten"
require "minitest/pride"
require "minitest/autorun"

class TestDayTen2020 < Minitest::Test
  def setup
    @lines = File.open("inputs/2020/day_ten.in").readlines.map(&:strip).map(&:to_i)
  end

  def test_part_one
    result = DayTen2020.part_one(@lines)

    assert_equal 2482, result
  end

  def test_part_two
    result = DayTen2020.part_two(@lines)

    assert_equal 96_717_311_574_016, result
  end
end
