# frozen_string_literal: true

require_relative "../../src/2018/day_nine"

class TestDayNine2018 < Minitest::Test
  def setup
    lines = File.open("inputs/2018/day_nine.in")
    @input = lines.readlines.first.strip
  end

  def test_part_one
    result = DayNine2018.part_one(@input)

    assert_equal 422_980, result
  end

  def test_part_two
    result = DayNine2018.part_two(@input)

    assert_equal 3_552_041_936, result
  end
end
