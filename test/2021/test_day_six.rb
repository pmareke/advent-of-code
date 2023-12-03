# frozen_string_literal: true

require_relative "../../src/2021/day_six"
require "minitest/autorun"

class TestDaySix2021 < Minitest::Test
  def setup
    lines = File.open("inputs/2021/day_six.in")
    @input = lines.readlines.first.strip
  end

  def test_part_one
    result = DaySix2021.part_one(@input)

    assert_equal 390_011, result
  end

  def test_part_two
    result = DaySix2021.part_two(@input)

    assert_equal 1_746_710_169_834, result
  end
end
