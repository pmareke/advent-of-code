# frozen_string_literal: true

require_relative "../../src/2015/day_ten"

class TestDayTen2015 < Minitest::Test
  def setup
    @sequence = File.open("inputs/2015/day_ten.in").readlines.first.strip
  end

  def test_part_one
    result = DayTen2015.part_one(@sequence)

    assert_equal 360_154, result
  end

  def test_part_two
    result = DayTen2015.part_two(@sequence)

    assert_equal 5_103_798, result
  end
end
