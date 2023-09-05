require_relative "../../src/2020/day_one"

class TestDayOne2020 < Minitest::Test
  def setup
    @numbers = File.open("inputs/2020/day_one.in").map(&:to_i)
  end

  def test_part_one
    result = DayOne2020::part_one(@numbers)

    assert_equal result, 918339
  end

  def test_part_two
    result = DayOne2020::part_two(@numbers)

    assert_equal result, 23869440
  end
end
