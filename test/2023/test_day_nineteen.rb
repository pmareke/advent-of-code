# frozen_string_literal: true

require_relative "../../src/2023/day_nineteen"
require "minitest/pride"
require "minitest/autorun"

class TestDayNineteen2023 < Minitest::Test
  def setup
    @lines = File.read("inputs/2023/day_nineteen.in")
  end

  def test_part_one
    result = DayNineteen2023.part_one(@lines)

    assert_equal 401_674, result
  end

  def test_part_two
    result = DayNineteen2023.part_two(@lines)

    assert_equal 134_906_204_068_564, result
  end
end
