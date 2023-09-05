require_relative "../../src/2015/day_one"

class TestDayOne2015 < Minitest::Test
  def setup
    @parenthesis = File
      .open("inputs/2015/day_one.in")
      .readlines()
      .first
      .split("")
  end

  def test_part_one
    result = DayOne2015::part_one(@parenthesis)

    assert_equal result, 280
  end

  def test_part_two
    result = DayOne2015::part_two(@parenthesis)

    assert_equal result, 1797
  end
end
