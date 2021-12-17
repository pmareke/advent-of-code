import { solvePart1, solvePart2 } from '../../src/2021/day_17';
import { readAllLines } from '../../utils';
import { TestCase } from '../../utils/types';

const example: string[] = ['target area: x=20..30, y=-10..-5'];

const real: string[] = readAllLines('2021', '17');

describe('Day Seventeenth', () => {
  describe('Part One', () => {
    const testCases: TestCase<string>[] = [
      {
        name: 'example',
        input: example,
        expected: 45,
      },
      {
        name: 'real',
        input: real,
        expected: 5050,
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
        expected: 112,
      },
      {
        name: 'real',
        input: real,
        expected: 2223,
      },
    ];

    testCases.forEach(({ name, input, expected }) => {
      it(`${name}`, () => {
        expect(solvePart2(input)).toBe(expected);
      });
    });
  });
});
