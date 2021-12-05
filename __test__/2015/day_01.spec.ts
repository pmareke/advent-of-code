import { solvePart1, solvePart2 } from '../../src/2015/day_01';
import { readFile } from '../../utils';
import { TestCase } from '../../utils/types';

describe('Day One', () => {
  const real = readFile('2015', '01');
  describe('Part One', () => {
    const testCases: TestCase<string>[] = [
      {
        name: 'example',
        input: ['))((((('],
        expected: 3,
      },
      {
        name: 'real',
        input: real,
        expected: 280,
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
        input: ['()())'],
        expected: 5,
      },
      {
        name: 'real',
        input: real,
        expected: 1797,
      },
    ];

    testCases.forEach(({ name, input, expected }) => {
      it(`${name}`, () => {
        expect(solvePart2(input)).toBe(expected);
      });
    });
  });
});
