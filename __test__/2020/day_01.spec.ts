import { solvePart1, solvePart2 } from '../../src/2020/day_01';
import { readAllLinesAsNumbers } from '../../utils';
import { TestCase } from '../../utils/types';

describe('Day One', () => {
  const example = [1721, 979, 366, 299, 675, 1456];
  const real = readAllLinesAsNumbers('2020', '01');
  describe('Part One', () => {
    const testCases: TestCase<number>[] = [
      {
        name: 'example',
        input: example,
        expected: 514579,
      },
      {
        name: 'real',
        input: real,
        expected: 918339,
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
        expected: 241861950,
      },
      {
        name: 'real',
        input: real,
        expected: 23869440,
      },
    ];

    testCases.forEach(({ name, input, expected }) => {
      it(`${name}`, () => {
        expect(solvePart2(input)).toBe(expected);
      });
    });
  });
});
