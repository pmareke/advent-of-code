import { solvePart1, solvePart2 } from '../../src/2020/day_02';
import { readAllLines } from '../../utils';
import { TestCase } from '../../utils/types';

describe('Day Two', () => {
  const example = ['1-3 a: abcde', '1-3 b: cdefg', '2-9 c: ccccccccc'];
  const real = readAllLines('2020', '02');
  describe('Part One', () => {
    const testCases: TestCase<string>[] = [
      {
        name: 'example',
        input: example,
        expected: 2,
      },
      {
        name: 'real',
        input: real,
        expected: 383,
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
        expected: 1,
      },
      {
        name: 'real',
        input: real,
        expected: 272,
      },
    ];

    testCases.forEach(({ name, input, expected }) => {
      it(`${name}`, () => {
        expect(solvePart2(input)).toBe(expected);
      });
    });
  });
});
