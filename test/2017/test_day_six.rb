# frozen_string_literal: true

require_relative "../../src/2017/day_six"

class TestDaySix2017 < Minitest::Test
  def setup
    lines = File.open("inputs/2017/day_six.in")
    @input = lines.readlines.map(&:strip).first
  end

  def test_part_one
    result = DaySix2017.part_one(@input)

    assert_equal 7864, result
  end

  def test_part_two
    result = DaySix2017.part_two(@input)

    assert_equal 1695, result
  end
end
