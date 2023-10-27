# frozen_string_literal: true

require_relative "../../src/2022/day_six"
require "minitest/autorun"

class TestDaySix2022 < Minitest::Test
  def setup
    @lines = File.open("inputs/2022/day_six.in").readlines
  end

  def test_part_one
    result = DaySix2022.part_one(@lines)

    assert_equal 1848, result
  end

  def test_part_two
    result = DaySix2022.part_two(@lines)

    assert_equal 2308, result
  end
end
