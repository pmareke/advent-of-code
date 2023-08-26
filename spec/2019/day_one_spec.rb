require_relative "../../src/2019/day_one"

describe DayOne2019 do
  before(:all) do
    @numbers = File.open("inputs/2019/day_one.in").map(&:to_i)
  end

  it "part one" do
    result = DayOne2019::part_one(@numbers)

    expect(result).to eq(3353880)
  end

  it "part two" do
    result = DayOne2019::part_two(@numbers)

    expect(result).to eq(5027950)
  end
end
