# frozen_string_literal: true

require "minitest/autorun"
require_relative "../../src/2022/day_four"

class TestDayFour2022 < Minitest::Test
  def setup
    @pairs = File.open("inputs/2022/day_four.in").map(&:strip)
  end

  def test_part_one
    result = DayFour2022.part_one(@pairs)

    assert_equal 498, result
  end

  def test_part_two
    result = DayFour2022.part_two(@pairs)

    assert_equal 859, result
  end
end
