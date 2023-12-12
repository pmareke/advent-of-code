# frozen_string_literal: true

require_relative "../../src/2017/day_seven"

class TestDaySeven2017 < Minitest::Test
  def setup
    lines = File.open("inputs/2017/day_seven.in")
    @input = lines.readlines.map(&:strip)
  end

  def test_part_one
    result = DaySeven2017.part_one(@input)

    assert_equal "dgoocsw", result
  end

  def test_part_two
    result = DaySeven2017.part_two(@input)

    assert_equal 1275, result
  end
end
