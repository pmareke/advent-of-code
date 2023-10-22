# frozen_string_literal: true

require_relative "../../src/2019/day_three"

class TestDayThree2019 < Minitest::Test
  def setup
    @wires = File.open("inputs/2019/day_three.in").readlines
  end

  def test_part_one
    result = DayThree2019.part_one(@wires)

    assert_equal 4981, result
  end

  def test_part_two
    result = DayThree2019.part_two(@wires)

    assert_equal 164_012, result
  end
end
