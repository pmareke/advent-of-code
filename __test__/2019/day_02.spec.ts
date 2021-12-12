import { solvePart1, solvePart2 } from '../../src/2019/day_02';
import { readAllLinesAsNumbers } from '../../utils';
import { TestCase } from '../../utils/types';

describe('Day Two', () => {
  const example = [1, 9, 10, 3, 2, 3, 11, 0, 99, 30, 40, 50];
  const real = readAllLinesAsNumbers('2019', '02');
  describe('Part One', () => {
    const testCases: TestCase<number>[] = [
      {
        name: 'example',
        input: example,
        expected: 3500,
      },
      {
        name: 'real',
        input: real,
        expected: 3716250,
      },
    ];

    testCases.forEach(({ name, input, expected }) => {
      it(`${name}`, () => {
        expect(solvePart1(input)).toBe(expected);
      });
    });
  });

  describe.skip('Part Two', () => {
    const testCases: TestCase<number>[] = [
      {
        name: 'example',
        input: example,
        expected: 1202,
      },
      {
        name: 'real',
        input: real,
        expected: 6472,
      },
    ];

    testCases.forEach(({ name, input, expected }) => {
      it(`${name}`, () => {
        expect(solvePart2(input)).toBe(expected);
      });
    });
  });
});
