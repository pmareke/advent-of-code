# frozen_string_literal: true

require_relative "../../src/2019/day_nine"

class TestDayNine2019 < Minitest::Test
  def setup
    @numbers = File.open("inputs/2019/day_nine.in").readlines.first.split(",").map(&:to_i)
  end

  def test_part_one
    result = DayNine2019.part_one(@numbers)

    assert_equal 3_429_606_717, result
  end

  def test_part_two
    result = DayNine2019.part_two(@numbers)

    assert_equal 33_679, result
  end
end
