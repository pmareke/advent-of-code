import { solvePart1, solvePart2 } from '../../src/2021/day_07';
import { readFile } from '../../utils';
import { TestCase } from '../../utils/types';

const example = ['16,1,2,0,4,2,7,1,2,14'];

const real: string[] = readFile('2021', '07');

describe('Day Seven', () => {
  describe('Part One', () => {
    const testCases: TestCase<string>[] = [
      {
        name: 'example',
        input: example,
        expected: 37,
      },
      {
        name: 'real',
        input: real,
        expected: 356922,
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
        expected: 168,
      },
      {
        name: 'real',
        input: real,
        expected: 100347031,
      },
    ];

    testCases.forEach(({ name, input, expected }) => {
      it(`${name}`, () => {
        expect(solvePart2(input)).toBe(expected);
      });
    });
  });
});
