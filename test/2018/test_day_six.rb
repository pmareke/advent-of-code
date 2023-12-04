# frozen_string_literal: true

require_relative "../../src/2018/day_six"
require "minitest/autorun"

class TestDaySix2018 < Minitest::Test
  def setup
    lines = File.open("inputs/2018/day_six.in")
    @input = lines.readlines.map(&:strip)
  end

  def test_part_one
    result = DaySix2018.part_one(@input)

    assert_equal 3871, result
  end

  def test_part_two
    result = DaySix2018.part_two(@input)

    assert_equal 44_667, result
  end
end
