# frozen_string_literal: true

require_relative "../../src/2022/day_two"

class TestDayTwo2022 < Minitest::Test
  def setup
    pairs = File.open("inputs/2022/day_two.in").read.split(" ")
  end

  def test_part_one
    result = DayTwo2022.part_one(@pairs)

    assert_equal 72_070, result
  end

  def test_part_two
    result = DayTwo2022.part_two(@pairs)

    assert_equal 11373, result
  end
end
