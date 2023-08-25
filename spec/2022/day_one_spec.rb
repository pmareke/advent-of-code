require_relative "../../src/2022/day_one"

describe "Day One of 2022" do
  it 'Part One' do
    lines = File.open("inputs/2022/day_one.in")
    groups = lines.read().split("\n\n")
    result = DayOne::part_one(groups)

    expect(result).to eq(72070)
  end

  it 'Part Two' do
    lines = File.open("inputs/2022/day_one.in")
    groups = lines.read().split("\n\n")
    result = DayOne::part_two(groups)

    expect(result).to eq(211805)
  end
end
