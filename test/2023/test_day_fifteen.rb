# frozen_string_literal: true

require_relative "../../src/2023/day_fifteen"
require "minitest/autorun"

class TestDayFifteen2023 < Minitest::Test
  def setup
    file = "inputs/2023/day_fifteen.in"
    @lines = File.open(file).readlines.map(&:strip)
  end

  def test_part_one
    result = DayFifteen2023.part_one(@lines)

    assert_equal 513_643, result
  end

  def test_part_two
    result = DayFifteen2023.part_two(@lines)

    assert_equal 265_345, result
  end
end
