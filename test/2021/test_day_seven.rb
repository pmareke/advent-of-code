# frozen_string_literal: true

require_relative "../../src/2021/day_seven"
require "minitest/autorun"

class TestDaySeven2021 < Minitest::Test
  def setup
    lines = File.open("inputs/2021/day_seven.in")
    @input = lines.readlines.first.strip
  end

  def test_part_one
    result = DaySeven2021.part_one(@input)

    assert_equal 356_922, result
  end

  def test_part_two
    result = DaySeven2021.part_two(@input)

    assert_equal 100_347_031, result
  end
end
