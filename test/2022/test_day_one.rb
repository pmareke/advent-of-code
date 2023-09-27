# frozen_string_literal: true

require_relative "../../src/2022/day_one"

class TestDayOne2022 < Minitest::Test
  def setup
    lines = File.open("inputs/2022/day_one.in")
    @groups = lines.read.split("

")
  end

  def test_part_one
    result = DayOne2022.part_one(@groups)

    assert_equal 72_070, result
  end

  def test_part_two
    result = DayOne2022.part_two(@groups)

    assert_equal 211_805, result
  end
end
