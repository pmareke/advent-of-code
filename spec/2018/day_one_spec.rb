require_relative "../../src/2018/day_one"

class TestDayOne2018 < Minitest::Test
  def setup
    @numbers = File.open("inputs/2018/day_one.in").map(&:to_i)
  end

  def test_part_one
    result = DayOne2018::part_one(@numbers)

    assert_equal result, 402
  end

  def test_part_two
    result = DayOne2018::part_two(@numbers)

    assert_equal result, 481
  end
end
