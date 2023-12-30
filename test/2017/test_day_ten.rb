# frozen_string_literal: true

require_relative "../../src/2017/day_ten"

class TestDayTen2017 < Minitest::Test
  def setup
    lines = File.open("inputs/2017/day_ten.in")
    @input = lines.readlines.map(&:strip).first
  end

  def test_part_one
    result = DayTen2017.part_one(@input)

    assert_equal 11_375, result
  end

  def test_part_two
    result = DayTen2017.part_two(@input)

    assert_equal "e0387e2ad112b7c2ef344e44885fe4d8", result
  end
end
