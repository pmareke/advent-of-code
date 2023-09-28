# frozen_string_literal: true

require_relative "../../src/2020/day_two"

class TestDayTwo2020 < Minitest::Test
  def setup
    @lines = File.open("inputs/2020/day_two.in")
  end

  def test_part_one
    result = DayTwo2020.part_one(@lines)

    assert_equal 383, result
  end

  def test_part_two
    result = DayTwo2020.part_two(@lines)

    assert_equal 272, result
  end
end
