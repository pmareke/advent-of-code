require_relative "../../src/2018/day_one"

describe DayOne2018 do
  before(:all) do
    @numbers = File.open("inputs/2018/day_one.in").map(&:to_i)
  end

  it "part one" do
    result = DayOne2018::part_one(@numbers)

    expect(result).to eq(402)
  end

  it "part two" do
    result = DayOne2018::part_two(@numbers)

    expect(result).to eq(481)
  end
end
