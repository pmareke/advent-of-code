require_relative "../../src/2016/day_one"

class TestDayOne2016 < Minitest::Test
  def setup
    @coordinates = File
      .open("inputs/2016/day_one.in")
      .readlines()
      .first
      .split(", ")
  end

  def test_part_one
    result = DayOne2016::part_one(@coordinates)

    assert_equal result, 271
  end

  def test_part_two
    result = DayOne2016::part_two(@coordinates)

    assert_equal result, 153
  end
end
