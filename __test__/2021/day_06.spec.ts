import { solvePart1, solvePart2 } from '../../src/2021/day_06';
import { readFile } from '../../utils';
import { TestCase } from '../../utils/types';

const example = ['3,4,3,1,2'];

const real: string[] = readFile('2021', '06');

describe('Day Six', () => {
  describe('Part One', () => {
    const testCases: TestCase<string>[] = [
      {
        name: 'example',
        input: example,
        expected: 5934,
      },
      {
        name: 'real',
        input: real,
        expected: 390011,
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
        expected: 26984457539,
      },
      {
        name: 'real',
        input: real,
        expected: 1746710169834,
      },
    ];

    testCases.forEach(({ name, input, expected }) => {
      it(`${name}`, () => {
        expect(solvePart2(input)).toBe(expected);
      });
    });
  });
});
