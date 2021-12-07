import { solvePart1, solvePart2 } from '../../src/2017/day_02';
import { readAllLines } from '../../utils';
import { TestCase } from '../../utils/types';

describe('Day One', () => {
  const example = ['5\t9\t2\t8', '9\t4\t7\t3', '3\t8\t6\t5'];
  const real = readAllLines('2017', '02');
  describe('Part One', () => {
    const testCases: TestCase<string>[] = [
      {
        name: 'example',
        input: example,
        expected: 18,
      },
      {
        name: 'real',
        input: real,
        expected: 58975,
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
        expected: 9,
      },
      {
        name: 'real',
        input: real,
        expected: 308,
      },
    ];

    testCases.forEach(({ name, input, expected }) => {
      it(`${name}`, () => {
        expect(solvePart2(input)).toBe(expected);
      });
    });
  });
});
