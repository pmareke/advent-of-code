# frozen_string_literal: true

require_relative "../../src/2015/day_seven"

class TestDaySeven2015 < Minitest::Test
  def test_part_one
    @instructions = File.open("inputs/2015/day_seven.in").readlines.map(&:strip)
    result = DaySeven2015.part_one(@instructions)

    assert_equal 3176, result
  end

  def test_part_two
    @instructions = File.open("inputs/2015/day_seven_part_two.in").readlines.map(&:strip)
    result = DaySeven2015.part_two(@instructions)

    assert_equal 14_710, result
  end
end
