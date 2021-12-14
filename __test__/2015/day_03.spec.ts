import { solvePart1, solvePart2 } from '../../src/2015/day_03';
import { readAllLines } from '../../utils';
import { TestCase } from '../../utils/types';

describe('Day Three', () => {
  const example: string[] = ['^v'];
  const example1: string[] = ['^>v<'];
  const example2: string[] = ['^v^v^v^v^v'];
  const real = readAllLines('2015', '03');

  describe('Part One', () => {
    const testCases: TestCase<string>[] = [
      {
        name: 'example 1',
        input: example,
        expected: 2,
      },
      {
        name: 'example 2',
        input: example1,
        expected: 4,
      },
      {
        name: 'example 3',
        input: example2,
        expected: 2,
      },
      {
        name: 'real',
        input: real,
        expected: 2565,
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
        name: 'example 1',
        input: example,
        expected: 3,
      },
      {
        name: 'example 2',
        input: example1,
        expected: 3,
      },
      {
        name: 'example 3',
        input: example2,
        expected: 11,
      },
      {
        name: 'real',
        input: real,
        expected: 2639,
      },
    ];

    testCases.forEach(({ name, input, expected }) => {
      it(`${name}`, () => {
        expect(solvePart2(input)).toBe(expected);
      });
    });
  });
});
