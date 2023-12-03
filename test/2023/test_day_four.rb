# frozen_string_literal: true

require_relative "../../src/2023/day_four"

class TestDayFour2023 < Minitest::Test
  def setup
    lines = File.open("inputs/2023/day_four.in")
    @input = lines.readlines.map(&:strip)
  end

  def test_part_one
    result = DayFour2023.part_one(@input)

    assert_equal 0, result
  end

  def test_part_two
    result = DayFour2023.part_two(@input)

    assert_equal 0, result
  end
end
