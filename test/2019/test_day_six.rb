# frozen_string_literal: true

require_relative "../../src/2019/day_six"
require "minitest/autorun"

class TestDaySix2019 < Minitest::Test
  def setup
    lines = File.open("inputs/2019/day_six.in")
    @input = lines.readlines.map(&:strip)
  end

  def test_part_one
    result = DaySix2019.part_one(@input)

    assert_equal 247_089, result
  end

  def test_part_two
    result = DaySix2019.part_two(@input)

    assert_equal 442, result
  end
end
