# frozen_string_literal: true

require_relative "../../src/2023/day_seven"
require "minitest/autorun"

class TestDaySeven2023 < Minitest::Test
  def setup
    lines = File.open("inputs/2023/day_seven.in")
    @input = lines.readlines.map(&:strip)
  end

  def test_part_one
    result = DaySeven2023.part_one(@input)

    assert_equal 0, result
  end

  def test_part_two
    result = DaySeven2023.part_two(@input)

    assert_equal 0, result
  end
end
