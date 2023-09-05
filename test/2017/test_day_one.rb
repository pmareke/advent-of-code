require_relative "../../src/2017/day_one"

class TestDayOne2017 < Minitest::Test
  def setup
    @numbers = File
      .open("inputs/2017/day_one.in")
      .readlines()
      .first
      .strip
      .split("")
      .map(&:to_i)
  end

  def test_part_one
    result = DayOne2017::part_one(@numbers)

    assert_equal result, 1203
  end

  def test_part_two
    result = DayOne2017::part_two(@numbers)

    assert_equal result, 1146
  end
end
