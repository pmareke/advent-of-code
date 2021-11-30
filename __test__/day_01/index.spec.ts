import { solvePart1, solvePart2 } from '../../src/day_01';
import { readAllLines, readAllLinesAsNumbers } from '../../utils';

describe('Day One', () => {
  it('Solution Part One', () => {
    const actual = solvePart1(readAllLines('01'));
    const expected = '1';

    expect(actual[0]).toEqual(expected);
  });

  it('Solution Part Two', () => {
    const actual = solvePart2(readAllLinesAsNumbers('01'));
    const expected = 1;

    expect(actual[0]).toEqual(expected);
  });
});
