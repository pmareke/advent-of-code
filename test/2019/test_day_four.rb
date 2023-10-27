# frozen_string_literal: true

require_relative "../../src/2019/day_four"

class TestDayFour2019 < Minitest::Test
  def setup
    @numbers = File.open("inputs/2019/day_four.in").readlines.first
  end

  def test_part_one
    result = DayFour2019.part_one(@numbers)

    assert_equal 1063, result
  end

  def test_part_two
    result = DayFour2019.part_two(@numbers)

    assert_equal 686, result
  end
end
