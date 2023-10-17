# frozen_string_literal: true

require_relative "../../src/2021/day_three"

class TestDayThree2021 < Minitest::Test
  def setup
    @numbers = File.open("inputs/2021/day_three.in").readlines.map(&:strip)
  end

  def test_part_one
    result = DayThree2021.part_one(@numbers)

    assert_equal 2_035_764, result
  end

  def test_part_two
    result = DayThree2021.part_two(@numbers)

    assert_equal 2_817_661, result
  end
end
