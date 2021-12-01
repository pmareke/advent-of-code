import { solvePart1, solvePart2 } from '../../src/day_01';
import { readAllLinesAsNumbers } from '../../utils';
import { TestCase } from '../../utils/types';

describe('Day One', () => {
  describe('Part One', () => {
    const testCases: TestCase<number>[] = [
      {
        name: 'example',
        input: [199, 200, 208, 210, 200, 207, 240, 269, 260, 263],
        expected: 7,
      },
      {
        name: 'real input',
        input: readAllLinesAsNumbers('01'),
        expected: 1722,
      },
    ];

    testCases.forEach(({ name, input, expected }) => {
      it(`Solution: ${name}`, () => {
        expect(solvePart1(input)).toBe(expected);
      });
    });
  });

  describe('Part Two', () => {
    const testCases: TestCase<number>[] = [
      {
        name: 'example',
        input: [199, 200, 208, 210, 200, 207, 240, 269, 260, 263],
        expected: 5,
      },
      {
        name: 'real input',
        input: readAllLinesAsNumbers('01'),
        expected: 1748,
      },
    ];

    testCases.forEach(({ name, input, expected }) => {
      it(`Solution: ${name}`, () => {
        expect(solvePart2(input)).toBe(expected);
      });
    });
  });
});
