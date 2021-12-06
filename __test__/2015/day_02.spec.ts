import { solvePart1, solvePart2 } from '../../src/2015/day_02';
import { readFile } from '../../utils';
import { TestCase } from '../../utils/types';

describe('Day One', () => {
  const real = readFile('2015', '02');
  describe('Part One', () => {
    const testCases: TestCase<string>[] = [
      {
        name: 'example',
        input: ['2x3x4'],
        expected: 58,
      },
      {
        name: 'example',
        input: ['1x1x10'],
        expected: 43,
      },
      {
        name: 'real',
        input: real,
        expected: 1606483,
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
        input: ['2x3x4'],
        expected: 34,
      },
      {
        name: 'example',
        input: ['1x1x10'],
        expected: 14,
      },
      {
        name: 'real',
        input: real,
        expected: 3842356,
      },
    ];

    testCases.forEach(({ name, input, expected }) => {
      it(`${name}`, () => {
        expect(solvePart2(input)).toBe(expected);
      });
    });
  });
});
