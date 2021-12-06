import { solvePart1, solvePart2 } from '../../src/2016/day_01';
import { readFile } from '../../utils';
import { TestCase } from '../../utils/types';

describe('Day One', () => {
  const real = readFile('2016', '01');
  describe('Part One', () => {
    const testCases: TestCase<string>[] = [
      {
        name: 'example',
        input: ['R5, L5, R5, R3'],
        expected: 12,
      },
      {
        name: 'real',
        input: real,
        expected: 271,
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
        input: ['R8, R4, R4, R8'],
        expected: 4,
      },
      {
        name: 'real',
        input: real,
        expected: 153,
      },
    ];

    testCases.forEach(({ name, input, expected }) => {
      it(`${name}`, () => {
        expect(solvePart2(input)).toBe(expected);
      });
    });
  });
});
