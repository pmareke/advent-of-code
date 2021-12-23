import { solvePart1, solvePart2 } from '../../src/2016/day_02';
import { readAllLines } from '../../utils';
import { TestCase } from '../../utils/types';

describe('Day Two', () => {
  const example = ['ULL', 'RRDDD', 'LURDL', 'UUUUD'];

  const real = readAllLines('2016', '02');
  describe('Part One', () => {
    const testCases: TestCase<string>[] = [
      {
        name: 'example',
        input: example,
        expected: 1985,
      },
      {
        name: 'real',
        input: real,
        expected: 65556,
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
        expected: '5DB3',
      },
      {
        name: 'real',
        input: real,
        expected: 'CB779',
      },
    ];

    testCases.forEach(({ name, input, expected }) => {
      it(`${name}`, () => {
        expect(solvePart2(input)).toBe(expected);
      });
    });
  });
});
