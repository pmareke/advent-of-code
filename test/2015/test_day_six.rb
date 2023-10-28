# frozen_string_literal: true

require_relative "../../src/2015/day_six"

class TestDaySix2015 < Minitest::Test
  def setup
    @instructions = File.open("inputs/2015/day_six.in").readlines
  end

  def test_part_one
    skip("Too Slow")
    result = DaySix2015.part_one(@instructions)

    assert_equal 569_999, result
  end

  def test_part_two
    skip("Too Slow")
    result = DaySix2015.part_two(@instructions)

    assert_equal 17_836_115, result
  end
end
