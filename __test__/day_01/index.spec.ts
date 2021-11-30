import { solvePart1, solvePart2 } from '../../src/day_01';

describe('Day One', () => {
  it('Solution Part1', () => {
    const actual = solvePart1();
    const expected = '1';

    expect(actual[0]).toEqual(expected);
  });

  it('Solution Part2', () => {
    const actual = solvePart2();
    const expected = 1;

    expect(actual[0]).toEqual(expected);
  });
});
