import { solvePart1, solvePart2 } from '../../src/2017/day_01';
import { readFile } from '../../utils';
import { TestCase } from '../../utils/types';

describe('Day One', () => {
  const real = readFile('2017', '01');
  describe('Part One', () => {
    const testCases: TestCase<string>[] = [
      {
        name: 'example',
        input: ['91212129'],
        expected: 9,
      },
      {
        name: 'example',
        input: ['1122'],
        expected: 3,
      },
      {
        name: 'example',
        input: ['1111'],
        expected: 4,
      },
      {
        name: 'example',
        input: ['1234'],
        expected: 0,
      },
      {
        name: 'real',
        input: real,
        expected: 1203,
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
        input: ['12131415'],
        expected: 4,
      },
      {
        name: 'real',
        input: real,
        expected: 1146,
      },
    ];

    testCases.forEach(({ name, input, expected }) => {
      it(`${name}`, () => {
        expect(solvePart2(input)).toBe(expected);
      });
    });
  });
});
