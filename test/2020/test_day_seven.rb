# frozen_string_literal: true

require_relative "../../src/2020/day_seven"
require "minitest/autorun"

class TestDaySeven2020 < Minitest::Test
  def setup
    @lines = File.open("inputs/2020/day_seven.in").readlines.map(&:strip)
  end

  def test_part_one
    result = DaySeven2020.part_one(@lines)

    assert_equal 278, result
  end

  def test_part_two
    result = DaySeven2020.part_two(@lines)

    assert_equal 45_157, result
  end
end
