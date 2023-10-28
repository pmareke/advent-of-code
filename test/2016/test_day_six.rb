# frozen_string_literal: true

require_relative "../../src/2016/day_six"
require "minitest/autorun"

class TestDaySix2016 < Minitest::Test
  def setup
    @lines = File.open("inputs/2016/day_six.in").readlines
  end

  def test_part_one
    result = DaySix2016.part_one(@lines)

    assert_equal "qzedlxso", result
  end

  def test_part_two
    result = DaySix2016.part_two(@lines)

    assert_equal "ucmifjae", result
  end
end
