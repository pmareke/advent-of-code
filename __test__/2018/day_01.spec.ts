import { solvePart1, solvePart2 } from '../../src/2018/day_01';
import { readAllLinesAsNumbers } from '../../utils';
import { TestCase } from '../../utils/types';

describe('Day One', () => {
  const real = readAllLinesAsNumbers('2018', '01');
  describe('Part One', () => {
    const testCases: TestCase<number>[] = [
      {
        name: 'example',
        input: [1, 1, 1],
        expected: 3,
      },
      {
        name: 'example',
        input: [1, 1, -2],
        expected: 0,
      },
      {
        name: 'example',
        input: [-1, -2, -3],
        expected: -6,
      },
      {
        name: 'real',
        input: real,
        expected: 402,
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
        input: [1, -1],
        expected: 0,
      },
      {
        name: 'example',
        input: [3, 3, 4, -2, -4],
        expected: 10,
      },
      {
        name: 'example',
        input: [-6, 3, 8, 5, -6],
        expected: 5,
      },
      {
        name: 'example',
        input: [7, 7, -2, -7, -4],
        expected: 14,
      },
      {
        name: 'real',
        input: real,
        expected: 481,
      },
    ];

    testCases.forEach(({ name, input, expected }) => {
      it(`${name}`, () => {
        expect(solvePart2(input)).toBe(expected);
      });
    });
  });
});
