require_relative "../../src/2021/day_one"

describe DayOne2021 do
  before(:all) do
    @numbers = File.open("inputs/2021/day_one.in").map(&:to_i)
  end

  it "part one" do
    result = DayOne2021::part_one(@numbers)

    expect(result).to eq(1722)
  end

  it "part two" do
    result = DayOne2021::part_two(@numbers)

    expect(result).to eq(1748)
  end
end
