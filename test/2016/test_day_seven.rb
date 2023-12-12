# frozen_string_literal: true

require_relative "../../src/2016/day_seven"

class TestDaySeven2016 < Minitest::Test
  def setup
    @lines = File.open("inputs/2016/day_seven.in").readlines.map(&:strip)
  end

  def test_part_one
    result = DaySeven2016.part_one(@lines)

    assert_equal 118, result
  end

  def test_part_two
    result = DaySeven2016.part_two(@lines)

    assert_equal 260, result
  end
end
