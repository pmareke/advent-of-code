# frozen_string_literal: true

require_relative "../../src/2023/day_sixteen"
require "minitest/autorun"

class TestDaySixteen2023 < Minitest::Test
  def setup
    file = "inputs/2023/day_sixteen.in"
    @lines = File.open(file).readlines.map(&:strip)
  end

  def test_part_one
    result = DaySixteen2023.part_one(@lines)

    assert_equal 0, result
  end

  def test_part_two
    result = DaySixteen2023.part_two(@lines)

    assert_equal 0, result
  end
end