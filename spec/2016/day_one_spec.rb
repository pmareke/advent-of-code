require_relative "../../src/2016/day_one"

describe DayOne2016 do
  before(:all) do
    @coordinates = File
      .open("inputs/2016/day_one.in")
      .readlines()
      .first
      .split(", ")
  end

  it "part one" do
    result = DayOne2016::part_one(@coordinates)

    expect(result).to eq(271)
  end

  it "part two" do
    result = DayOne2016::part_two(@coordinates)

    expect(result).to eq(153)
  end
end
