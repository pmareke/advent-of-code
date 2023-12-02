# frozen_string_literal: true

require_relative "../../src/2023/day_two"

class TestDayTwo2023 < Minitest::Test
  def setup
    lines = File.open("inputs/2023/day_two.in")
    @games = lines.readlines.map(&:strip)
  end

  def test_part_one
    result = DayTwo2023.part_one(@games)

    assert_equal 2101, result
  end

  def test_part_two
    result = DayTwo2023.part_two(@games)

    assert_equal 58_269, result
  end
end
