require_relative "../../src/2015/day_two"

class TestDayTwo2015 < Minitest::Test
  def setup
    @dimensions = File
      .open("inputs/2015/day_two.in")
      .readlines()
  end

  def test_part_one
    result = DayTwo2015::part_one(@dimensions)

    assert_equal result, 1606483
  end

  def test_part_two
    result = DayTwo2015::part_two(@dimensions)

    assert_equal result, 3842356
  end
end
