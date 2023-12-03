# frozen_string_literal: true

require_relative "../../src/2020/day_six"
require "minitest/autorun"

class TestDaySix2020 < Minitest::Test
  def setup
    @lines = File.read("inputs/2020/day_six.in")
  end

  def test_part_one
    result = DaySix2020.part_one(@lines)

    assert_equal 6726, result
  end

  def test_part_two
    result = DaySix2020.part_two(@lines)

    assert_equal 3316, result
  end
end
