# frozen_string_literal: true

require_relative "../../src/2018/day_two"

class TestDayTwo2018 < Minitest::Test
  def setup
    @sentences = File.open("inputs/2018/day_two.in")
  end

  def test_part_one
    result = DayTwo2018.part_one(@sentences)

    assert_equal 4940, result
  end

  def test_part_two
    result = DayTwo2018.part_two(@sentences)

    assert_equal "wrziyfdmlumeqvaatbiosngkc", result
  end
end
