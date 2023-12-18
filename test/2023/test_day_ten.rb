# frozen_string_literal: true

require_relative "../../src/2023/day_ten"
require "minitest/pride"
require "minitest/autorun"

class TestDayTen2023 < Minitest::Test
  def setup
    file = "inputs/2023/day_ten.in"
    @lines = File.readlines(file).map(&:strip)
  end

  def test_part_one
    result = DayTen2023.part_one(@lines)

    assert_equal 6725, result
  end

  def test_part_two
    result = DayTen2023.part_two(@lines)

    assert_equal 383, result
  end
end
