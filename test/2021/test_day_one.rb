require_relative "../../src/2021/day_one"

class TestDayOne2021 < Minitest::Test
  def setup
    @numbers = File.open("inputs/2021/day_one.in").map(&:to_i)
  end

  def test_part_one
    result = DayOne2021::part_one(@numbers)

    assert_equal result, 1722
  end

  def test_part_two
    result = DayOne2021::part_two(@numbers)

    assert_equal result, 1748
  end
end
