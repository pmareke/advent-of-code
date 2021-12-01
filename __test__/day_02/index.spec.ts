import { solvePart1, solvePart2 } from '../../src/day_02';
import { TestCase } from '../../utils/types';

describe('Day Two', () => {
  const example: number[] = [];
  const real: number[] = [];
  describe('Part One', () => {
    const testCases: TestCase<number>[] = [
      {
        name: 'example',
        input: example,
        expected: 0,
      },
      {
        name: 'real',
        input: real,
        expected: 0,
      },
    ];

    testCases.forEach(({ name, input, expected }) => {
      it(`Solution: ${name}`, () => {
        expect(solvePart1(input)).toBe(expected);
      });
    });
  });

  describe('Part Two', () => {
    const testCases: TestCase<number>[] = [
      {
        name: 'example',
        input: example,
        expected: 0,
      },
      {
        name: 'real',
        input: real,
        expected: 0,
      },
    ];

    testCases.forEach(({ name, input, expected }) => {
      it(`Solution: ${name}`, () => {
        expect(solvePart2(input)).toBe(expected);
      });
    });
  });
});
