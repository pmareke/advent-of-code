require_relative "../../src/2015/day_one"

describe DayOne2015 do
  before(:all) do
    @parenthesis = File
      .open("inputs/2015/day_one.in")
      .readlines()
      .first
      .split("")
  end

  it "part one" do
    result = DayOne2015::part_one(@parenthesis)

    expect(result).to eq(280)
  end

  it "part two" do
    result = DayOne2015::part_two(@parenthesis)

    expect(result).to eq(1797)
  end
end
