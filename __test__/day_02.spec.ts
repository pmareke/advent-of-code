import { solvePart1, solvePart2 } from '../src/day_02';
import { readAllLines } from '../utils';
import { TestCase } from '../utils/types';

describe('Day Two', () => {
  const example: string[] = [
    'forward 5',
    'down 5',
    'forward 8',
    'up 3',
    'down 8',
    'forward 2',
  ];
  const real: string[] = readAllLines('02');
  describe('Part One', () => {
    const testCases: TestCase<string>[] = [
      {
        name: 'example',
        input: example,
        expected: 150,
      },
      {
        name: 'real',
        input: real,
        expected: 1815044,
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
        expected: 900,
      },
      {
        name: 'real',
        input: real,
        expected: 1739283308,
      },
    ];

    testCases.forEach(({ name, input, expected }) => {
      it(`${name}`, () => {
        expect(solvePart2(input)).toBe(expected);
      });
    });
  });
});
