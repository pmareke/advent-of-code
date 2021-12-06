import { solvePart1, solvePart2 } from '../../src/2019/day_01';
import { readAllLinesAsNumbers } from '../../utils';
import { TestCase } from '../../utils/types';

describe('Day One', () => {
  const example = [100756];
  const real = readAllLinesAsNumbers('2019', '01');
  describe('Part One', () => {
    const testCases: TestCase<number>[] = [
      {
        name: 'example',
        input: example,
        expected: 33583,
      },
      {
        name: 'real',
        input: real,
        expected: 3353880,
      },
    ];

    testCases.forEach(({ name, input, expected }) => {
      it(`${name}`, () => {
        expect(solvePart1(input)).toBe(expected);
      });
    });
  });

  describe('Part Two', () => {
    const testCases: TestCase<number>[] = [
      {
        name: 'example',
        input: example,
        expected: 50346,
      },
      {
        name: 'real',
        input: real,
        expected: 5027950,
      },
    ];

    testCases.forEach(({ name, input, expected }) => {
      it(`${name}`, () => {
        expect(solvePart2(input)).toBe(expected);
      });
    });
  });
});
