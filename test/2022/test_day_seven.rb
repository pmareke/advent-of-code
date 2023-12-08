# frozen_string_literal: true

require_relative "../../src/2022/day_seven"
require "minitest/autorun"

class TestDaySeven2022 < Minitest::Test
  def setup
    @lines = File.open("inputs/2022/day_seven.in").readlines.map(&:strip)
  end

  def test_part_one
    result = DaySeven2022.part_one(@lines)

    assert_equal 1_297_683, result
  end

  def test_part_two
    result = DaySeven2022.part_two(@lines)

    assert_equal 5_756_764, result
  end
end
