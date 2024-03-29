# frozen_string_literal: true

require_relative "../../src/2023/day_sixteen"

class TestDaySixteen2023 < Minitest::Test
  def setup
    file = "inputs/2023/day_sixteen.in"
    @lines = File.open(file).readlines.map(&:strip)
  end

  def test_part_one
    result = DaySixteen2023.part_one(@lines)

    assert_equal 6906, result
  end

  def test_part_two
    result = DaySixteen2023.part_two(@lines)

    assert_equal 7330, result
  end
end
