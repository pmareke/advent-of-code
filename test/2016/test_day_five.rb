# frozen_string_literal: true

require_relative "../../src/2016/day_five"
require "minitest/autorun"

class TestDayFive2016 < Minitest::Test
  def setup
    @door_id = File.open("inputs/2016/day_five.in").readlines.first.strip
  end

  def test_part_one
    skip("Too Slow")
    result = DayFive2016.part_one(@door_id)

    assert_equal "4543c154", result
  end

  def test_part_two
    skip("Too Slow")
    result = DayFive2016.part_two(@door_id)

    assert_equal "1050cbbd", result
  end
end
