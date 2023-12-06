# frozen_string_literal: true

require_relative "../../src/2023/day_six"

class TestDaySix2023 < Minitest::Test
  def setup
    lines = File.open("inputs/2023/day_six.in")
    @lines = lines.readlines.map(&:strip)
  end

  def test_part_one
    result = DaySix2023.part_one(@lines)

    assert_equal 2_269_432, result
  end

  def test_part_two
    result = DaySix2023.part_two(@lines)

    assert_equal 35_865_985, result
  end
end
