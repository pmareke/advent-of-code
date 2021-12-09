import { solvePart1, solvePart2 } from '../../src/2021/day_09';
import { readAllLines } from '../../utils';
import { TestCase } from '../../utils/types';

const example: string[] = [
  '2199943210',
  '3987894921',
  '9856789892',
  '8767896789',
  '9899965678',
];

const real: string[] = readAllLines('2021', '09');

describe('Day Nine', () => {
  describe('Part One', () => {
    const testCases: TestCase<string>[] = [
      {
        name: 'example',
        input: example,
        expected: 15,
      },
      {
        name: 'example',
        input: real,
        expected: 539,
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
        name: 'example',
        input: example,
        expected: 1134,
      },
      {
        name: 'real',
        input: real,
        expected: 736920,
      },
    ];

    testCases.forEach(({ name, input, expected }) => {
      it(`${name}`, () => {
        expect(solvePart2(input)).toBe(expected);
      });
    });
  });
});
