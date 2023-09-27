# frozen_string_literal: true

require_relative "../../src/2020/day_one"

class TestDayOne2020 < Minitest::Test
  def setup
    @numbers = File.open("inputs/2020/day_one.in").map(&:to_i)
  end

  def test_part_one
    result = DayOne2020.part_one(@numbers)

    assert_equal 918_339, result
  end

  def test_part_two
    result = DayOne2020.part_two(@numbers)

    assert_equal 23_869_440, result
  end
end
