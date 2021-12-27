import { solvePart1, solvePart2 } from '../../src/2015/day_04';
import { readAllLines } from '../../utils';
import { TestCase } from '../../utils/types';

describe('Day Three', () => {
  const real = readAllLines('2015', '04');

  describe('Part One', () => {
    const testCases: TestCase<string>[] = [
      {
        name: 'real',
        input: real,
        expected: 346386,
      },
    ];

    testCases.forEach(({ name, input, expected }) => {
      it(`${name}`, () => {
        expect(solvePart1(input)).toBe(expected);
      });
    });
  });

  describe('Part Two', () => {
    const testCases: TestCase<string>[] = [
      {
        name: 'real',
        input: real,
        expected: 9958218,
      },
    ];

    testCases.forEach(({ name, input, expected }) => {
      it(`${name}`, () => {
        expect(solvePart2(input)).toBe(expected);
      });
    });
  });
});
