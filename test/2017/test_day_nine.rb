# frozen_string_literal: true

require_relative "../../src/2017/day_nine"

class TestDayNine2017 < Minitest::Test
  def setup
    @input = File.read("inputs/2017/day_nine.in")
  end

  def test_part_one
    result = DayNine2017.part_one(@input)

    assert_equal 10_800, result
  end

  def test_part_two
    result = DayNine2017.part_two(@input)

    assert_equal 4522, result
  end
end
