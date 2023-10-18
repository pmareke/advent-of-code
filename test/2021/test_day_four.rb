# frozen_string_literal: true

require_relative "../../src/2021/day_four"

class TestDayFour021 < Minitest::Test
  def setup
    @numbers, *@cards = File.open("inputs/2021/day_four.in").readlines.join.split("\n\n")
  end

  def test_part_one
    result = DayFour2021.part_one(@numbers, @cards)

    assert_equal 39_902, result
  end

  def test_part_two
    result = DayFour2021.part_two(@numbers, @cards)

    assert_equal 26_936, result
  end
end
