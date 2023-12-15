# frozen_string_literal: true

require_relative "../../src/2018/day_seven"

class TestDaySeven2018 < Minitest::Test
  def setup
    lines = File.open("inputs/2018/day_seven.in")
    @input = lines.readlines.map(&:strip)
  end

  def test_part_one
    result = DaySeven2018.part_one(@input)

    assert_equal "CFMNLOAHRKPTWBJSYZVGUQXIDE", result
  end

  def test_part_two
    result = DaySeven2018.part_two(@input)

    assert_equal 971, result
  end
end
