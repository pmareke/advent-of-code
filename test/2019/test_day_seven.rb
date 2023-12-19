# frozen_string_literal: true

require_relative "../../src/2019/day_seven"
require "minitest/pride"
require "minitest/autorun"

class TestDaySeven2019 < Minitest::Test
  def setup
    @numbers = File.open("inputs/2019/day_seven.in").readlines.first.split(",").map(&:to_i)
  end

  def test_part_one
    result = DaySeven2019.part_one(@numbers)

    assert_equal 30_940, result
  end

  def test_part_two
    result = DaySeven2019.part_two(@numbers)

    assert_equal 76_211_147, result
  end
end
