import { solvePart1, solvePart2 } from '../../src/2016/day_03';
import { readAllLines } from '../../utils';
import { TestCase } from '../../utils/types';

describe('Day Three', () => {
  const real = readAllLines('2016', '03');

  describe('Part One', () => {
    const testCases: TestCase<string>[] = [
      {
        name: 'real',
        input: real,
        expected: 983,
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
        expected: 1836,
      },
    ];

    testCases.forEach(({ name, input, expected }) => {
      it(`${name}`, () => {
        expect(solvePart2(input)).toBe(expected);
      });
    });
  });
});
