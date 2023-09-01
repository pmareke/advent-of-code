require_relative "../../src/2015/day_two"

describe DayTwo2015 do
  before(:all) do
    @dimensions = File
      .open("inputs/2015/day_two.in")
      .readlines()
  end

  it "part one" do
    result = DayTwo2015::part_one(@dimensions)

    expect(result).to eq(1606483)
  end

  it "part two" do
    result = DayTwo2015::part_two(@dimensions)

    expect(result).to eq(3842356)
  end
end
