import { readAllLinesAsNumbers } from '../../utils';
import { TestCase } from '../../utils/types';
import { solvePart1, solvePart2 } from '../../src/2021/day_01';

describe('Day One', () => {
  const example = [199, 200, 208, 210, 200, 207, 240, 269, 260, 263];
  const real = readAllLinesAsNumbers('01');
  describe('Part One', () => {
    const testCases: TestCase<number>[] = [
      {
        name: 'example',
        input: example,
        expected: 7,
      },
      {
        name: 'real',
        input: real,
        expected: 1722,
      },
    ];

    testCases.forEach(({ name, input, expected }) => {
      it(`${name}`, () => {
        expect(solvePart1(input)).toBe(expected);
      });
    });
  });

  describe('Part Two', () => {
    const testCases: TestCase<number>[] = [
      {
        name: 'example',
        input: example,
        expected: 5,
      },
      {
        name: 'real',
        input: real,
        expected: 1748,
      },
    ];

    testCases.forEach(({ name, input, expected }) => {
      it(`${name}`, () => {
        expect(solvePart2(input)).toBe(expected);
      });
    });
  });
});
