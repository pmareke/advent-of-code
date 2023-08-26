require_relative "../../src/2017/day_one"

describe DayOne2017 do
  before(:all) do
    @numbers = File
      .open("inputs/2017/day_one.in")
      .readlines()
      .first
      .strip
      .split("")
      .map(&:to_i)
  end

  it "part one" do
    result = DayOne2017::part_one(@numbers)

    expect(result).to eq(1203)
  end

  it "part two" do
    result = DayOne2017::part_two(@numbers)

    expect(result).to eq(1146)
  end
end
