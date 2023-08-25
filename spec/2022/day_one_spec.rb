require_relative "../../src/2022/day_one"

describe DayOne2022 do
  before(:all) do
    lines = File.open("inputs/2022/day_one.in")
    @groups = lines.read().split("

")
  end

  it "part one" do
    result = DayOne2022::part_one(@groups)

    expect(result).to eq(72070)
  end

  it "part two" do
    result = DayOne2022::part_two(@groups)

    expect(result).to eq(211805)
  end
end
