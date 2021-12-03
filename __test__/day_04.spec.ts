import { solvePart1, solvePart2 } from '../src/day_04';
import { TestCase } from '../utils/types';

const example: string[] = [];
const real: string[] = [];

describe('Day Four', () => {
  describe('Part One', () => {
    const testCases: TestCase<string>[] = [
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
        expected: 0,
      },
      {
        name: 'real',
        input: real,
        expected: 0,
      },
    ];

    testCases.forEach(({ name, input, expected }) => {
      it(`${name}`, () => {
        expect(solvePart2(input)).toBe(expected);
      });
    });
  });
});
